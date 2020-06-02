# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.com/oxr463/pam_oauth2.git"
EGIT_COMMIT="5cbe070cf1c79e7346c6a4e9d00f480f7fd405ae"

inherit eutils git-r3

DESCRIPTION="OAuth2-Module for PAM"
HOMEPAGE="https://github.com/quarxConnect/pam_oauth2"
LICENSE="GPL-3+"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="net-misc/curl"
DEPEND="${BDEPEND}"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-fix-cli-target.patch" )

src_install() {
	insinto /$(get_libdir)/security
	dolib.so pam_oauth2.so
}
