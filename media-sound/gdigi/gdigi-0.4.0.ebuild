# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/desowin/gdigi.git"
EGIT_COMMIT="f94ed1c93be68a73670f159bb28a5b9b5b5d3fc1"

inherit eutils git-r3

DESCRIPTION="a tool aimed to provide X-Edit functionality to Linux users"
HOMEPAGE="http://desowin.org/gdigi/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/alsa-lib
		x11-libs/gtk+:3
		dev-libs/glib
		dev-libs/expat
		dev-libs/libxml2"

RDEPEND="${DEPEND}"

src_install() {
	dobin gdigi
}
