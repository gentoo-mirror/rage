# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_4 )

EGIT_REPO_URI="https://github.com/ulfox/GSE"
EXPERIMENTAL="true"

inherit eutils git-r3

DESCRIPTION="Gentoo Stateless Environment"
HOMEPAGE="https://wiki.gentoo.org/wiki/User:Ulfox/GSoC-GSE"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE="ccache distcc"

RDEPEND="dev-util/catalyst
	ccache? ( dev-util/ccache )
	distcc? ( sys-devel/distcc )"

DEPEND="${RDEPEND}"

INSTALL_DIR="${EPREFIX}/opt/${PN}"

src_compile() {
	:
}

src_install() {
	insinto "${INSTALL_DIR}"
	doins -r *
}

pkg_postinst() {
	einfo "For more info on this package, see:"
	einfo "${HOMEPAGE}"
}
