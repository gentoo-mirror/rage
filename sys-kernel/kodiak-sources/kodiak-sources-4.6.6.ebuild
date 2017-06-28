# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

MY_P="fire-phone_src_${PV}"

DESCRIPTION="Amazon Fire Phone Kernel Sources"
HOMEPAGE="https://www.amazon.com/gp/help/customer/display.html/ref=hp_bc_nav?ie=UTF8&nodeId=201399100"
SRC_URI="https://fire-phone-src.s3.amazonaws.com/z6qIQG7tiQp8PcgZIwJmmkxgNj/${MY_P}"

SLOT="0"
KEYWORDS="~arm"
IUSE="experimental"

src_unpack() {
	unpack ${MY_P}
	unpack platform.tar
	# kernel/qcom/3.4
}

src_install() {
	install_sources
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on these kernel sources, see:"
	einfo "${HOMEPAGE}"
}
