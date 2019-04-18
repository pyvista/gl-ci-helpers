# ci-helpers


This repository contains a set of scripts that are used by the
.travis.yml and appveyor.yml files of `vtki`-based packages for the
Travis and AppVeyor services respectively.

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
    - "git clone --depth 1 git://github.com/vtkiorg/ci-helpers.git"
    - "powershell ci-helpers/appveyor/install_opengl.ps1"
```
