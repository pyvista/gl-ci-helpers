# gl-ci-helpers


This repository contains a set of scripts that are used by the
`.travis.yml` and `appveyor.yml` files of `vtki`-based packages for the
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
  - "git clone --depth 1 git://github.com/vtkiorg/gl-ci-helpers.git"
  - "powershell gl-ci-helpers/appveyor/install_opengl.ps1"
```

### Travis

Include the following in the `before_script` section of your `.travis.yml`
(please note that you might have to use a `xenial` linux distribution)

```yml
dist: xenial
before_script:
  # configure a headless display
  - git clone --depth 1 git://github.com/vtkiorg/gl-ci-helpers.git
  - source ./gl-ci-helpers/travis/setup_headless_display.sh
```
