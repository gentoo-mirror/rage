# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1

MY_PN="${PN/_/-}"
DESCRIPTION="A vintage 1980s DOS inspired Twitter Bootstrap theme for MkDocs"
HOMEPAGE="https://lramage94.github.io/mkdocs-bootstrap386"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
