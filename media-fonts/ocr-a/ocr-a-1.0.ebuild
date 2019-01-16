# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="OCR-A font, conformant to ANSI X3.17-1977, in TrueType format, with sources"
HOMEPAGE="https://ocr-a-font.sourceforge.io"
SRC_URI="mirror://sourceforge/projects/ocr-a-font/files/OCR-A/1.0/OCRA.ttf"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"
IUSE=""

DEPEND=""

src_unpack() { :; }

S="${DISTDIR}"
FONT_S=${S}
FONT_SUFFIX="ttf"
