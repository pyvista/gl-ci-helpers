# gl-ci-helpers

[![Build Status](https://travis-ci.org/pyvista/gl-ci-helpers.svg?branch=master)](https://travis-ci.org/pyvista/gl-ci-helpers)
[![Build Status](https://dev.azure.com/pyvista/gl-ci-helpers/_apis/build/status/pyvista.gl-ci-helpers?branchName=master)](https://dev.azure.com/pyvista/gl-ci-helpers/_build/latest?definitionId=1&branchName=master)
[![Build status](https://ci.appveyor.com/api/projects/status/97622gd8ce1e3hgn/branch/master?svg=true)](https://ci.appveyor.com/project/banesullivan/gl-ci-helpers/branch/master)

This repository contains a set of scripts that are used by the
`.travis.yml` and `appveyor.yml` files of `pyvista`-based packages for the
Travis and AppVeyor services respectively.

These scripts help set up OpenGL related features like headless displays
on the CI-services.

The idea is to clone these at the last minute when the continuous integration
is about to be run. This is better than including this repository as a
sub-module, because this allows updates to this repository to take effect
immediately, and not have to update the sub-module every time a change is made.

## How to use

### AppVeyor

Include the following lines at the start of the `install` section in
`appveyor.yml`:

```yml
install:
  # configure a headless display
  - "git clone --depth 1 git://github.com/pyvista/gl-ci-helpers.git"
  - "powershell gl-ci-helpers/appveyor/install_opengl.ps1"
  - "SET PYVISTA_OFF_SCREEN=True"
```

### Travis

Include the following in the `before_script` section of your `.travis.yml`
(please note that you might have to use a `xenial` linux distribution)

```yml
dist: xenial
before_install:
  # configure a headless display
  - git clone --depth 1 git://github.com/pyvista/gl-ci-helpers.git
  - source ./gl-ci-helpers/travis/setup_headless_display.sh
```
