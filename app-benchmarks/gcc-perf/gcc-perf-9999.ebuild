# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

EGIT_REPO_URI="https://github.com/bitbank2/gcc_perf"
EGIT_COMMIT="71cab040c6606599af2d2d3ced7acbc3ee25bb95"

DESCRIPTION="Test ARM/X86 C/SIMD/ASM perf"
HOMEPAGE="https://github.com/bitbank2/gcc_perf"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm"

src_install() {
	dobin gcc_perf
}
