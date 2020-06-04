# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_PN="gcc-arm-none-eabi"
_PV="9-2020-q2-update"
_P="${_PN}-${_PV}"

DESCRIPTION="Pre-built GNU toolchain for Arm Cortex-M and Cortex-R processors"
HOMEPAGE="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm"
SRC_URI="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-${_PV}-x86_64-linux.tar.bz2"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${_P}"

QA_PREBUILT="opt/${_P}/*"

src_install() {
	local TOOLCHAIN_HOME="/opt/${_P}"

	dodir ${TOOLCHAIN_HOME%/*}
	mv "${S}" "${ED%/}"${TOOLCHAIN_HOME} || die
}
