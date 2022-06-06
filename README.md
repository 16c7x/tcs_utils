# tcs_utils

Welcome to your new module. A short overview of the generated parts can be found
in the [PDK documentation][1].

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with tcs_utils](#setup)
1. [Tasks](#tasks)
1. [Migrated facts](#migrated_facts)
1. [Development - Guide for contributing to the module](#development)

## Description

This module provides utilities for TCS.

## Setup

There are no setup requirements, add this module to an internal git repository and then add it to the Puppetfile.

## Tasks

Once added to the Puppetfile, go to the tasks menu on Puppet Enterprise, in the tasks text box type tcs_utils, you will see a list of the available tasks. A description of their function is available in the metadata.

## Migrated_facts

Migrated tasks is not designed to be used in continuous enforcement, nodes are to be classified temporarily. This class provides a mechanism to export Heira data from the Puppet server to a fact file on the target node.
Ensure there is a correctly populated file in the control_repo Hiera data directory for all nodes classified with this class, a failure to do this will result in an error.

```
# data/nodes/node.example.com.yaml
---
bu: BU1
class: pre-prod
classes: role_base_linux
location: uk1
patch_release: 12345
```

## Development

To contribute, create your own branch of this project, develop your code and submit a merge request for review. 

## Release Notes/Contributors/Etc. **Optional**

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
