#!/bin/sh
source "$PWD/../builder-utils/slackwarerepository.sh"

REPOSITORY="$1"

GenerateRepositoryUrls "$REPOSITORY"

DownloadPackage "blueman" &
DownloadPackage "accountsservice" &
DownloadPackage "aspell" &
DownloadPackage "babl" &
DownloadPackage "dbus-python" &
DownloadPackage "dconf" &
DownloadPackage "enchant" &
DownloadPackage "ffmpegthumbnailer" &
DownloadPackage "hunspell" &
wait
DownloadPackage "iso-codes" &
DownloadPackage "jasper" &
DownloadPackage "keybinder3" &
DownloadPackage "libcanberra" &
DownloadPackage "libgpod" &
DownloadPackage "libgtop" &
wait
DownloadPackage "libnma" &
DownloadPackage "libspectre" &
DownloadPackage "libwnck3" &
DownloadPackage "libxklavier" &
DownloadPackage "network-manager-applet" &
DownloadPackage "svgalib" &
DownloadPackage "xtrans" &
wait

### slackware current only packages

if [ $SLACKWAREVERSION == "current" ]; then
	DownloadPackage "libappindicator" &
	DownloadPackage "libdbusmenu" &
	DownloadPackage "libindicator" &
	DownloadPackage "libsoup" & # for stable this libsoup2 will be in 002-xorg
	wait
fi

### temporary packages for further building

DownloadPackage "boost" & # to build exempi
DownloadPackage "enchant" & # to build pluma
DownloadPackage "glade" & # to build gtksourceview4
DownloadPackage "gst-plugins-base" &
DownloadPackage "gstreamer" &
DownloadPackage "gtk+2" & # to build mate-themes
DownloadPackage "libgtop" & # to build mate-utils
DownloadPackage "python-pip" & # to install lxml
wait

### script clean up

rm FILE_LIST
rm serverPackages.txt
