# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :test do
  gem 'voxpupuli-test', '~> 5.4',   :require => false
  gem 'coveralls',                  :require => false
  gem 'simplecov-console',          :require => false
  gem 'puppet_metadata', '~> 1.0',  :require => false

  gem 'puppet-lint-legacy_facts-check', '~> 1.0.4',            require: false
  gem 'puppet-lint-no_erb_template-check', '~> 1.0.0',         require: false
  gem 'puppet-lint-optional_default-check',                    require: false
  gem 'puppet-lint-package_ensure-check', '~> 0.2.0',          require: false
  gem 'puppet-lint-resource_reference_syntax', '~> 1.1.0',     require: false
  gem 'puppet-lint-strict_indent-check', '~> 2.0.8',           require: false
  gem 'puppet-lint-template_file_extension-check', '~> 0.1.3', require: false
  gem 'puppet-lint-top_scope_facts-check', '~> 1.0.1',         require: false
  gem 'puppet-lint-trailing_newline-check', '~> 1.1.0',        require: false
  gem 'puppet-lint-unquoted_string-check', '~> 2.1.0',         require: false
  gem 'puppet-lint-variable_contains_upcase', '~> 1.2.0',      require: false
end

group :development do
  gem 'guard-rake',               :require => false
  gem 'overcommit', '>= 0.39.1',  :require => false
end

group :system_tests do
  gem 'voxpupuli-acceptance', '~> 1.0',  :require => false
end

group :release do
  gem 'github_changelog_generator', '>= 1.16.1',  :require => false if RUBY_VERSION >= '2.5'
  gem 'voxpupuli-release', '>= 1.2.0',            :require => false
  gem 'puppet-strings', '>= 2.2',                 :require => false
end

gem 'rake', :require => false
gem 'facter', ENV['FACTER_GEM_VERSION'], :require => false, :groups => [:test]

puppetversion = ENV['PUPPET_GEM_VERSION'] || '>= 6.0'
gem 'puppet', puppetversion, :require => false, :groups => [:test]

# vim: syntax=ruby
