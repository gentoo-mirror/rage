# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

MY_PN="${PN/_/-}"
DESCRIPTION="A vintage 1980s DOS inspired Twitter Bootstrap theme for MkDocs"
HOMEPAGE="https://lramage.gitlab.io/mkdocs-bootstrap386"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
