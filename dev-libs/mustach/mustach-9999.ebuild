# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://gitlab.com/jobol/mustach"
EGIT_COMMIT="d84608a69033d38c81b8fcff0cb272e225dd5428"

inherit eutils git-r3

DESCRIPTION="C implementation of the mustache template library"
HOMEPAGE="https://gitlab.com/jobol/mustach"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/json-c:="

src_install() {
	insinto /usr/include
	doins "${PN}".c
	doheader "${PN}".h

	dobin "${PN}"
}
