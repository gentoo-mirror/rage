# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="Android bootimg creation tool"
HOMEPAGE="https://github.com/osm0sis/mkbootimg"
SRC_URI="https://github.com/osm0sis/mkbootimg.git"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"
