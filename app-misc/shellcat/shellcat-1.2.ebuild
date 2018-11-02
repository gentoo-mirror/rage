# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A template processor, which uses shell script syntax"
HOMEPAGE="http://jwilk.net/software/shellcat"
SRC_URI="https://github.com/jwilk/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64"

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
