# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_BASE_VER="3.4.0"
K_SECURITY_UNSUPPORTED="1"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Amazon Fire Phone Kernel Sources"
HOMEPAGE="https://www.amazon.com/gp/help/customer/display.html/ref=hp_bc_nav?ie=UTF8&nodeId=201399100"
LICENSE="GPL-2"

MY_P="fire-phone_src_${PV}"
SRC_URI="https://fire-phone-src.s3.amazonaws.com/z6qIQG7tiQp8PcgZIwJmmkxgNj/${MY_P}.tar.bz2"
S="${WORKDIR}/kernel/qcom/3.4/"

SLOT="0"
KEYWORDS="~arm"
IUSE="binary otg kexec"

DEPEND="binary? ( sys-kernel/genkernel )"
RDEPEND="kexec? ( sys-apps/kexec-tools )"

src_unpack() {
	unpack ${MY_P}.tar.bz2
	unpack "${WORKDIR}/platform.tar"
}

src_prepare() {
	# TODO compress default config and use devspace instead.
	# https://devmanual.gentoo.org/ebuild-writing/functions/src_prepare/epatch/index.html
	epatch "${FILESDIR}/${P}-generic-config.patch"
}

src_compile() {
	! use binary && return

	#ARCH=arm
	#CROSS_COMPILE=arm-linux-gnueabihf
}

install_sources() {
	cd "${S}"
	dodir /usr/src
	echo ">>> Copying sources..."
	mv "../3.4/" "${ED}"/usr/src/"${P}" || die
	# if the symlink doesnt exist, lets create it
	[[ ! -h ${EROOT}usr/src/linux ]] && ln -sf ${P} "${EROOT}"usr/src/linux || die
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on these kernel sources, see:"
	einfo "${HOMEPAGE}"
}
