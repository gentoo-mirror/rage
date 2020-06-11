# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils toolchain-funcs

_PN="libfyaml"
DESCRIPTION="Fully feature complete YAML parser and emitter"
HOMEPAGE="https://github.com/pantoniou/libfyaml"
SRC_URI="https://github.com/pantoniou/${_PN}/releases/download/v${PV}/${_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libltdl"
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/check dev-vcs/git"
S="${WORKDIR}/${_PN}-${PV}"

src_prepare() {
	default
	./bootstrap.sh || die "Failed to bootstrap configure files"
}
