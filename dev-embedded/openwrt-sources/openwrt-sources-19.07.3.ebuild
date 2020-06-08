# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_PN="openwrt"
_P="${_PN}-${PV}"

DESCRIPTION="Buildsystem for the OpenWrt Linux distribution"
HOMEPAGE="https://openwrt.org"
SRC_URI="https://github.com/openwrt/openwrt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/bzip2
	app-arch/fastjar
	app-arch/sharutils
	app-arch/unzip
	app-arch/zip
	app-text/asciidoc
	dev-java/openjdk-bin:=
	dev-libs/libxslt
	dev-libs/openssl
	dev-vcs/git
	dev-vcs/mercurial
	net-misc/rsync
	net-misc/wget
	net-wireless/b43-fwcutter
	sys-apps/gawk
	sys-apps/util-linux
	sys-devel/bc
	sys-devel/binutils:=
	sys-devel/gcc:=
	sys-devel/gettext
	sys-libs/ncurses
	sys-libs/zlib
	sys-process/time
	virtual/cdrtools
	virtual/libusb:=
	virtual/perl-ExtUtils-MakeMaker
	x11-libs/gtk+:2
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/intltool
	sys-devel/bin86
	sys-devel/dev86
	sys-devel/flex
"
S="${WORKDIR}/${_P}"

src_prepare() { :; }

src_compile() { :; }

src_install() {
	local SRC_DIR="/usr/src/${_P}"

	dodir ${SRC_DIR%/*}
	mv "${S}" "${ED%/}"${SRC_DIR} || die
}
