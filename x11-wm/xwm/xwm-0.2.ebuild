# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig toolchain-funcs

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/oxr463/${PN}.git"
	EXPERIMENTAL="true"
else
	SRC_URI="https://gitlab.com/oxr463/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~x86-fbsd"
fi

DESCRIPTION="eXtended Window Manager is based on dwm-plus, a fork of dwm."
HOMEPAGE="https://gitlab.com/oxr463/xwm"
LICENSE="MIT"

SLOT="0"
IUSE="xinerama"

RDEPEND="media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
	xinerama? ( x11-libs/libXinerama )"

DEPEND="${RDEPEND}
	xinerama? ( x11-base/xorg-proto )"

src_prepare() {
	default

	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Os/CFLAGS += -std=c99 -pedantic -Wall/" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s ||g}" \
		-e "s/#XINERAMALIBS =/XINERAMALIBS ?=/" \
		-e "s/#XINERAMAFLAGS =/XINERAMAFLAGS ?=/" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		-e "s/\/freetype2/\ -I\/usr\/include\/freetype2/" \
		"${S}/src/config.mk" || die
	sed -i \
		-e '/@echo CC/d' \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die
}

src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC)
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS=""
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
	if ! has_version x11-misc/dmenu; then
		elog "Installing ${PN} without x11-misc/dmenu"
		einfo "To have a menu you can install x11-misc/dmenu"
	fi
}
