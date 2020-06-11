# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

DESCRIPTION="OBD-II compliant car diagnostic tool."
HOMEPAGE="http://www.obdtester.com/pyobd"
LICENSE="GPL-2"

SRC_URI="http://www.obdtester.com/download/${PN}_${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ncurses wxwidgets"

RDEPEND="dev-python/pyserial
	wxwidgets? ( dev-python/wxpython:= )"

DEPEND="ncurses? ( sys-libs/ncurses:* )
	${RDEPEND}"

src_configure() {
	sed -i 's/UTF8/UTF-8/g' "${PN}.desktop"
	sed -i 's/\r//g' "${PN}.desktop"
}

src_install() {
	insinto /usr/share/applications/
	doins "${PN}.desktop"
	dodir "/usr/share/${PN}/"
	insinto "/usr/share/${PN}/"
	for FILE in debugEvent.py obd2_codes.py	obd_io.py obd_sensors.py "${PN}" "${PN}".gif
	do
		doins "${FILE}"
	done
	dosym "${D}/usr/share/${PN}/${PN}" "${D}/usr/bin/${PN}"
}
