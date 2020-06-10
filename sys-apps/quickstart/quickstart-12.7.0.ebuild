# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == "9999" ]] ; then

inherit git-r3

	EGIT_REPO_URI="https://gitlab.com/oxr463/quickstart.git"
else
	SRC_URI="https://gitlab.com/oxr463/quickstart/-/archive/v${PV}/quickstart-v${PV}.tar.bz2 -> ${P}.tar.bz2"
fi

DESCRIPTION="An installer for Gentoo Linux written in POSIX shell"
HOMEPAGE="https://gitlab.com/oxr463/quickstart"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
IUSE="cifs doc lvm nfs raid samba test uefi"

DEPEND="app-admin/syslog-ng
		cifs? ( net-fs/cifs-utils )
		lvm? ( sys-fs/lvm2 )
		nfs? ( net-fs/nfs-utils )
		raid? ( sys-fs/mdadm )
		samba? ( net-fs/samba )
		sys-boot/grub
		sys-kernel/genkernel
		sys-process/cronie
		uefi? ( sys-fs/dosfstools )"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/pandoc )
		test? ( dev-util/shellcheck )"

src_install() {
	emake PREFIX="${EPREFIX}/usr" install
}
