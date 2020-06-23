# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Linux kernel module for a Ralink RT3290"
HOMEPAGE="https://github.com/loimu/rtbth-dkms"
SRC_URI="https://github.com/loimu/rtbth-dkms/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2+"

SLOT="0"
KEYWORDS="~amd64"
IUSE="dkms"

DEPEND="
	dkms? ( sys-kernel/dkms )
	virtual/linux-sources
	virtual/modutils
"
RDEPEND="${DEPEND}"
