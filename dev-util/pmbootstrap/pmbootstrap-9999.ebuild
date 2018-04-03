# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_4 )

EGIT_REPO_URI="https://github.com/postmarketOS/pmbootstrap"
EXPERIMENTAL="true"

inherit eutils git-r3

DESCRIPTION="Sophisticated chroot/build/flash tool to develop and install postmarketOS."
HOMEPAGE="https://postmarketos.org/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/openssl:*"
RDEPEND="${DEPEND}"

INSTALL_DIR="/opt/${PN}"
TARGET="${PN}.py"

src_compile() {
	:
}

src_install() {
	insinto "${INSTALL_DIR}"
	doins -r *
	dosym "${INSTALL_DIR}/${TARGET}" "${EPREFIX}/usr/local/bin/${PN}"
}

pkg_postinst() {
	chmod +x "${INSTALL_DIR}/${TARGET}"
}
