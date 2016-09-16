# install-go
Scripts to install and update Go for 64bit Linux and Windows systems.

## Shell
Shell scripts for installing and updating Go.  These are consistent with the instructions on https://golang.org/doc/install

These scripts should be run as the user for which you want Go.  __Do not run as `sudo`__.  This breaks things.

### install_current
Installs the current release of Go to `/usr/local/go`.  By default, the `$GOPATH` is set to `~/go` and the directory is created.  This can be overridden by using either the `-w` or `--workspace` flag. `$GOPATH`, `$GOPATH/bin`, and  `/usr/local/go/bin` are added to the `~/.bashrc` file.

#### Help output
This is the help output of the script, which provides all of the information needed to use it:

```
Usage: ./install_current [OPTIONS]

  The default workspace location is $HOME/go

  -h, --help       print help message
  -w, --workspace  specify a custom workspace ($GOPATH)
```

### install_go
This script is a copy of [Eric Lagergren's](https://github.com/EricLagergren) [InstallGo](https://gist.github.com/EricLagergren/ddea0f327d38f8c3a918) script.  It allows for the specification of the Go version to install along with the OS and arch.

#### Help output
This is the help output of the script, which provides all of the information needed to use it:

```
Usage: ./install_go [OPTIONS] versions...

  Versions must be valid Go version numbers.
  (E.g., 1.5.3, 1.6, 1.4.2, etc.)

  -o, --goos        specify the operating system to download
  -a, --goarch      specify the architecture to download
  -p, --possible    print possible GOOS/GOARCH combinations
  -v, --version     print version
  -h, --help        print help message

```
### upgrade_go
This script upgrades the current Go installation to the current release.  It assumes that the Go is installation directory is `/usr/local/go`.

The contents of `/usr/local/go` are removed.  Then the current release of Go is downloaded and extracted to `/usr/local/`.

## Powershell
Powershell scripts for installing the current release and updating Go to the current release.

### install_current.ps1
Installs the current Go release using the `msi` installer.  Manual intervention is necessary to complete the installation.  The default `$GOPATH` is `$HOME/Documents/code/go`.  A custom `$GOPATH` location can be set by passing the `-w` flag along with the path to use.  The `$GOPATH` directory will be created if it doesn't already exist.

### upgrade_go.ps1
This script upgrades the current Go installation to the current release using the current release's `zip` file.

The contents of `$GOPATH\bin` are removed prior to upgrading Go.

## License
Everything except `install_go` is MIT Licensed.  See LICENSE file for more information.

`install_go` license:

```
version 0.1
By eric@ericlagergren.com

This software is Public Domain.
The person who associated a work with this deed has dedicated
the work to the public domain by waiving all of his or her
rights to the work worldwide under copyright law, including
all related and neighboring rights, to the extent allowed by law.

You can copy, modify, distribute and perform the work, even for
commercial purposes, all without asking permission.

For more information: https://creativecommons.org/publicdomain/zero/1.0/
```
