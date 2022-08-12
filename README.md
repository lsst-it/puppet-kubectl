# kubectl

## Table of Contents

1. [Overview](#overview)
1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Overview

Install `kubectl`.

## Description

This module installs the
[`kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
binary.

## Usage

### Default version

```puppet
include kubectl
```

### Explicit Version

```puppet
class { 'kubectl':
  version  => '1.24.0',
  checksum => '94d686bb6772f6fb59e3a32beff908ab406b79acdfb2427abdc4ac3ce1bb98d7',
}
```

## Reference

See [REFERENCE](REFERENCE.md)
