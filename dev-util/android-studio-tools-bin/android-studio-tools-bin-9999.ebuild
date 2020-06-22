# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_PV="6514223"

DESCRIPTION="Command line tools for Android Studio"
HOMEPAGE="https://developer.android.com/studio"
SRC_URI="https://dl.google.com/android/repository/commandlinetools-linux-${_PV}_latest.zip -> ${P}.zip"
LICENSE="android"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/tools"

QA_PREBUILT="opt/${PN}/*"

src_install() {
	ANDROID_STUDIO_HOME="/opt/${PN}"

	dodir ${ANDROID_STUDIO_HOME%/*}
	mv "${S}" "${ED%/}"${ANDROID_STUDIO_HOME} || die
}
