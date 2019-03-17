# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SEI CERT C Coding Standard"
EDITION="2016"
HOMEPAGE="https://resources.sei.cmu.edu/library/asset-view.cfm?assetID=454220"

SRC_URI="https://resources.sei.cmu.edu/downloads/secure-coding/assets/${PN}-${EDITION}-v${PV}.pdf"

LICENSE="CERT"
SLOT="${EDITION}"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
S="${WORKDIR}/${PN}"

src_unpack() {
	mkdir -p "${S}"
	cp "${DISTDIR}/${PN}-${EDITION}-v${PV}.pdf" "${S}"
}

src_install() {
	dodoc "${PN}-${EDITION}-v${PV}.pdf"
}
