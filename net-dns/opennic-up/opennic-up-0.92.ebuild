# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="OpenNIC auto DNS updater"
HOMEPAGE="https://github.com/kewlfft/opennic-up"
SRC_URI="https://github.com/kewlfft/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-analyzer/fping
	net-dns/ldns-utils
	net-misc/curl"

DEPEND="${RDEPEND}"

RESTRICT="test"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dosbin ${PN}
	doinitd "${FILESDIR}/${PN}"
	insinto "/etc/${PN}"
	doins "${PN}".conf
	systemd_dounit "${PN}.service"
	systemd_dounit "${PN}.timer"
}

pkg_postinst() {
	elog "To start at boot, add opennic-up to the default runlevel with:"
	elog ""
	elog "    rc-update add opennic-up default"
	elog "    or"
	elog "    systemctl enable opennic-up"
}
