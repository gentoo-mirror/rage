# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit android

DESCRIPTION="Android terminal and Linux environment"
HOMEPAGE="https://termux.com"
SRC_URI="https://github.com/termux/termux-app/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0 GPL-3"

SLOT="0"
KEYWORDS="~arm64"
IUSE="android"

BDEPEND="
	~dev-java/gradle-bin-6.2.2
	~dev-util/android-ndk-21d
	|| ( dev-util/android-commandlinetools-bin dev-util/android-studio )
"
DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}-app-${PV}"

src_compile() {
	gradle --no-daemon assembleRelease
}

src_install() {
	doapk app/build/outputs/apk/release/app-release-unsigned.apk
}
