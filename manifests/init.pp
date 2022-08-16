#
# @summary Install kubectl binary
#
# @param version
#   kubectl release version
#
# @param checksum
#   Artifact checksum string
#
# @param checksum_type
#   The digest algorithm used for the checksum string.
#
# @param base_path
#   Base path under which to install software.
#
class kubectl (
  String $version                 = '1.24.3',
  String $checksum                = '8a45348bdaf81d46caf1706c8bf95b3f431150554f47d444ffde89e8cdd712c1',
  String $checksum_type           = 'sha256',
  Stdlib::Absolutepath $base_path = '/opt/kubectl',
) {
  $cmd          = 'kubectl'
  $bin_path     = '/usr/bin'
  $dl_path      = "${base_path}/dl"
  $version_path = "${dl_path}/${version}"

  $arch         = fact('os.architecture') ? {
    'x86_64' => 'amd64',
    default  => fact('os.architecture')
  }
  $base_url     = "https://dl.k8s.io/release/v${version}/bin/linux/${arch}"
  $archive_file = $cmd
  $source       = "${base_url}/${archive_file}"
  $dest_path    = "${version_path}/${archive_file}"

  file { [$base_path, $dl_path, $version_path]:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  archive { $archive_file:
    ensure        => present,
    checksum      => $checksum,
    checksum_type => $checksum_type,
    cleanup       => false,
    extract       => false,
    path          => $dest_path,
    source        => $source,
    require       => File[$version_path],
  }
  -> file { $dest_path:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  alternative_entry { $dest_path:
    ensure   => present,
    altlink  => "/usr/bin/${cmd}",
    altname  => $cmd,
    priority => 50,
    require  => Archive[$archive_file],
  }
  -> alternatives { $cmd:
    path => $dest_path,
  }
}
