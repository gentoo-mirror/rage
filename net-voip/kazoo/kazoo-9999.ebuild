# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/LineageOS/android_system_core"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
     app-arch/zip
     app-arch/unzip
     dev-libs/expat
     dev-libs/libxslt
     sys-libs/zlib
     dev-libs/openssl
     net-misc/curl
     sys-libs/ncurses:5
     dev-vcs/git
     dev-libs/expat
     app-text/htmldoc"

RDEPEND="${DEPEND}"
