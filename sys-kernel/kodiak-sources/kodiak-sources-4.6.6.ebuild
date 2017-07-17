# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Amazon Fire Phone Kernel Sources"
HOMEPAGE="https://www.amazon.com/gp/help/customer/display.html/ref=hp_bc_nav?ie=UTF8&nodeId=201399100"

MY_P="fire-phone_src_${PV}"
SRC_URI="https://fire-phone-src.s3.amazonaws.com/z6qIQG7tiQp8PcgZIwJmmkxgNj/${MY_P}.tar.bz2"
S="${WORKDIR}/kernel/qcom/3.4/"

SLOT="0"
KEYWORDS="~arm "
#IUSE="kexec otg"

src_unpack() {
	unpack ${MY_P}.tar.bz2
	unpack "${WORKDIR}/platform.tar"
}

install_sources() {
	cd "${S}"
	dodir /usr/src
	echo ">>> Copying sources..."
	mv "../3.4/" "${ED}"/usr/src/"${P}" || die
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on these kernel sources, see:"
	einfo "${HOMEPAGE}"
}
