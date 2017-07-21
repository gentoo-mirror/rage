# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="OBD-II compliant car diagnostic tool."
HOMEPAGE="http://www.obdtester.com/pyobd"
LICENSE="GPL-2"

SRC_URI="http://www.obdtester.com/download/${PN}_${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="wxwidgets"

RDEPEND="
	dev-python/pyserial
	wxwidgets? ( dev-python/wxpython:2.8 )"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

# workdir ${PN}-${PV}
