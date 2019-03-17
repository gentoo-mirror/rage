# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="Static analysis tool for checking compliance with Python docstring conventions"
HOMEPAGE="https://github.com/PyCQA/pydocstyle"
SRC_URI="https://github.com/PyCQA/pydocstyle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/snowballstemmer-1.2.1[${PYTHON_USEDEP}]
	test? (
		virtual/python-pathlib[${PYTHON_USEDEP}]
		>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-pep8[${PYTHON_USEDEP}]
	) "

python_test() {
	esetup.py test
}
