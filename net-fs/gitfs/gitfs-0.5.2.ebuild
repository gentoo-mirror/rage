# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Version controlled file system"
HOMEPAGE="https://www.presslabs.com/code/gitfs"
SRC_URI="https://github.com/presslabs/gitfs/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	~dev-python/atomiclong-0.1.1
	~dev-python/cffi-1.12.3
	~dev-python/fusepy-3.0.1
	~dev-python/pycparser-2.19
	~dev-python/pygit2-0.28.2
	~dev-python/raven-6.10.0
	~dev-python/six-1.12.0
"
RDEPEND="${DEPEND}"
