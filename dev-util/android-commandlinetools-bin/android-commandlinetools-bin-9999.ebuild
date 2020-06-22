# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit android

_PV="6514223"

DESCRIPTION="Command line tools for Android"
HOMEPAGE="https://developer.android.com"
SRC_URI="https://dl.google.com/android/repository/commandlinetools-linux-${_PV}_latest.zip -> ${P}.zip"
LICENSE="android"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/tools"

_D="${ANDROID_HOME}/cmdline-tools/tools"
QA_PREBUILT="opt/${PN}/*"

src_install() {
	dodir ${_D%/*}
	mv "${S}" "${ED%/}"${_D} || die
}

pkg_config() {
	# automatically accept licenses
	echo y | "${_D}/bin/sdkmanager"
}
