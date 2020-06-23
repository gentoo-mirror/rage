# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit android

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/termux/termux-app/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0 GPL-3"

SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	dev-java/gradle-bin
"
RDEPEND="${DEPEND}"

src_compile() {
	./gradlew assembleDebug || die
}
