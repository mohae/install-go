# install-go
Scripts to install and update Go for Darwin, FreeBSD, Linux, and Windows systems. These scripts support all precompiled architectures for the supported OS.

Bash is used for the shell scripts. Powershell is used for Windows.

## Shell
Shell scripts for installing and updating Go.  These are consistent with the instructions on https://golang.org/doc/install

These scripts should be run as the user for which you want Go.  __Do not run as root or with `sudo`__.  This breaks things.

### install_go
Installs Go to `/usr/local/go`.  By default, the `$GOPATH` is set to `~/go` and the directory is created.  This can be overridden by using either the `-w` or `--workspace` flag. `$GOPATH`, `$GOPATH/bin`, and  `/usr/local/go/bin` are added to the `~/.bashrc` file.

`install_go` defaults to the current version of Go, Linux, and amd64. Any valid Go release can be specified. For operating system, `darwin`, `freebsd`, or `linux` can be specified. The supported arch depends on what pre-compiled versions are provided for each OS.

#### Flags
short|long|alternate|description  
:--|:--|:--|:--  
-a|--arch|--goarch|specify the arch ($GOARCH)  
-h|--help||print help message  
-o|--os|--goos|specify the os ($GOOS)  
-s|--supported||list supported GOOS:GOARCH combinations  
-v|--version||specify the Go version  
-w|--workspace|--gopath|specify the workspace directory ($GOPATH)  

### upgrade_go
This script upgrades the current Go installation to the current release.  It assumes that the Go is installation directory is `/usr/local/go`.

The contents of `/usr/local/go` are removed.  Then the current release of Go is downloaded and extracted to `/usr/local/`.

If a specific version of Go is desired, it can be specified. Likewise with $GOOS and $GOARCH.

Use this when Go is already installed.

#### Flags
short|long|alternate|description  
:--|:--|:--|:--  
-a|--arch|--goarch|specify the arch ($GOARCH)  
-h|--help||print help message  
-o|--os|--goos|specify the os ($GOOS)  
-s|--supported||list supported GOOS:GOARCH combinations  
-v|--version||specify the Go version  
-w|--workspace|--gopath|specify the workspace directory ($GOPATH)  

### install_go_all
This script is a copy of [Eric Lagergren's](https://github.com/EricLagergren) [InstallGo](https://gist.github.com/EricLagergren/ddea0f327d38f8c3a918) script.  It allows for the specification of the Go version to install along with the OS and arch. IT supports a wider range of options than `install_go` and `upgrade_go`

#### Help output
This is the help output of the script, which provides all of the information needed to use it:

```
Usage: ./install_go_all [OPTIONS] versions...

  Versions must be valid Go version numbers.
  (E.g., 1.5.3, 1.6, 1.4.2, etc.)

  -o, --goos        specify the operating system to download
  -a, --goarch      specify the architecture to download
  -p, --possible    print possible GOOS/GOARCH combinations
  -v, --version     print version
  -h, --help        print help message

```

## Powershell
Powershell scripts for installing the current release and updating Go to the current release. Since these scripts are not signed, you may need to run the `Set-ExecutionPolicy` Cmdlet first.

### install_go.ps1
Installs the current Go release using the `msi` installer.  Manual intervention is necessary to complete the installation.  The default `$GOPATH` is `$HOME/Documents/code/go`.  A custom `$GOPATH` location can be set by passing the `-w` flag along with the path to use.  The `$GOPATH` directory will be created if it doesn't already exist.

### upgrade_go.ps1
This script upgrades the current Go installation to the current release using the current release's `zip` file.

The contents of `$GOPATH\bin` are removed prior to upgrading Go.

## License
Everything except `install_go_all` is MIT Licensed.  See LICENSE file for more information.

`install_go_all` license:

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
