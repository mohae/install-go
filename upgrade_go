#!/bin/bash
# upgrade to current version
version="1.9"
goarch="amd64"
goos="linux"
listsupported="false"

valid=(
	"darwin:386"
	"darwin:amd64"
	"freebsd:386"
	"freebsd:amd64"
	"linux:386"
	"linux:amd64"
	"linux:armv6l"
	"linux:ppc64le"
	"linux:390x"
	)

while [[ $# > 0 ]]
do
	case "$1" in
		-h|--help)
			echo ""
			echo "Usage: ./upgrade_go [OPTIONS]"
			echo ""
			echo "  Use when Go is already installed and you wish to install a different version"
			echo ""
			echo "  The default workspace location is $HOME/go"
			echo "  The default os is $goos"
			echo "  The default arch is $goarch"
			echo "  The default version is $version"
			echo ""
			echo "  OPTIONS:"
			echo "  -h, --help               print help message"
			echo "  -w, --workspace          specify a custom workspace (\$GOPATH)"
			echo "  -a, --arch, --goarch     specify the arch (\$GOARCH)"
			echo "  -o, --os, --goos         specify the os (\$GOOS)"
			echo "  -v, --version            specify the version"
			echo ""

			exit 0
			;;
		-w|--workspace)
			workspace="$2"
			shift
			;;
		-a|--goarch|--arch)
			goarch="$2"
			shift
			;;
		-o|--os|--goos)
			goos="$2"
			shift
			;;
		-v|--version)
			version="$2"
			shift
			;;
		-s|--supported)
			listsupported = true
			shift
			;;
	esac
shift
done


# see if it's a valid combination.
osarch=$goos$goarch

for v in "${valid[@]}"
do
	if [ "$v" = "$osarch" ] ; then
		isvalid=true
		break
	fi
done

# if it was an invalid combination them know
if ! $isvalid; then
	echo "invalid GOOS GOARCH combination: $goos $goarch"
fi

# if it was invalid or a listing was requested list supported combinations and exit
if ! $isvalid || $listsupported; then
	echo "supported GOOS GOARCH combinations:"
	for v in "${valid[@]}"
	do
		if [ "$v" = "linux:amd64" ]; then
			echo "     $v (default)"
		else
			echo "     $v"
		fi
	done
	 exit 1
fi

# everything is ok
# first download
# download and extract Go to /usr/local/go/
wget_output=$(wget -O /tmp/go.$version.tar.gz https://storage.googleapis.com/golang/go$version.$goos-$goarch.tar.gz)
if [ $? -ne 0 ]; then
	echo "unable to upgrade go to $version:"
	echo $wget_output
	exit 1
fi

# remove the old Go
sudo rm -rf /usr/local/go

echo "extracting /tmp/go.$version.tar.gz to /usr/local" 

tar_output=$(sudo tar xzf /tmp/go.$version.tar.gz -C /usr/local)
if [ $? -ne 0 ]; then
	echo "unable to install go $version"
	echo $tar_output
	exit 1
fi

echo "complete: go upgraded to $version"
