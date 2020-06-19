# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Utility to remove unused ELF sections causing warnings"
HOMEPAGE="https://github.com/termux/termux-elf-cleaner"
SRC_URI="https://github.com/termux/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm64"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
}
