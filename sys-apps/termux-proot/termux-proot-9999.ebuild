# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 eutils toolchain-funcs

EGIT_REPO_URI="https://github.com/proot-me/${MY_PN}.git"
DESCRIPTION="An chroot-like implementation using ptrace"
HOMEPAGE="https://wiki.termux.com/wiki/PRoot"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"
IUSE="doc static test"

RDEPEND="
	sys-libs/talloc
"
DEPEND="
	${RDEPEND}
	test? ( dev-util/valgrind )
	doc? ( dev-libs/libxslt )
"

# Tests are broken
RESTRICT="test"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	default
	use static && append-ldflags -static
}

src_compile() {
	# build the proot and care targets
	emake -C src V=1 \
		CC="$(tc-getCC)" \
		CHECK_VERSION="true" \
		proot
}

src_install() {
	dobin src/proot
	newman doc/proot/man.1 proot.1
	dodoc doc/proot/*.txt
	dodoc -r doc/articles
}

src_test() {
	emake -C tests -j1 CC="$(tc-getCC)"
}

pkg_postinst() {
	elog "If you have segfaults on recent (>4.8) kernels"
	elog "try to disable seccomp support like so:"
	elog "'export PROOT_NO_SECCOMP=1'"
	elog "prior to running proot"
}
