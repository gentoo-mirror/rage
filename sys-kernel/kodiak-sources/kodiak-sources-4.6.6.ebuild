# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_BASE_VER="3.4.0"
K_SECURITY_UNSUPPORTED="1"

inherit kernel-2 epatch mount-boot
detect_version
detect_arch

DESCRIPTION="Amazon Fire Phone Kernel Sources"
HOMEPAGE="https://www.amazon.com/gp/help/customer/display.html/ref=hp_bc_nav?ie=UTF8&nodeId=201399100"
LICENSE="GPL-2"

MY_P="fire-phone_src_${PV}"
SRC_URI="https://fire-phone-src.s3.amazonaws.com/z6qIQG7tiQp8PcgZIwJmmkxgNj/${MY_P}.tar.bz2"
S="${WORKDIR}/kernel/qcom/3.4/"

SLOT="0"
KEYWORDS="~arm"
IUSE="binary otg kexec"

RESTRICT="binchecks strip mirror"
DEPEND="binary? ( sys-kernel/genkernel )"
RDEPEND="kexec? ( sys-apps/kexec-tools )"

src_unpack() {
	unpack ${MY_P}.tar.bz2
	unpack "${WORKDIR}/platform.tar"
}

pkg_setup() {
	export REAL_ARCH="${ARCH}"
	unset ARCH; unset LDFLAGS # will inferfere with Makefile if set
}

src_prepare() {
	epatch "${FILESDIR}/misc-fixes.patch"
	eapply_user
	# TODO compress default config and use devspace instead.
	xz -cd "${FILESDIR}/config-${PV}" > "${S}/config"
}

src_compile() {
	! use binary && return
	install -d "${WORKDIR}/out/{lib,boot}"
	install -d "${T}/{cache,twork}"
	install -d "${WORKDIR}/build"
	DEFAULT_KERNEL_SOURCE="${S}" CMD_KERNEL_DIR="${S}" genkernel "${GKARGS}" \
		--no-save-config \
		--kernel-config="${T}/config" \
		--build-src="${S}" \
		--build-dst="${WORKDIR}/build" \
		--makeopts="${MAKEOPTS}" \
		--cachedir="${T}/cache" \
		--tempdir="${T}/twork" \
		--logfile="${WORKDIR}/genkernel.log" \
		--bootdir="${WORKDIR}/out/boot" \
		--module-prefix="${WORKDIR}/out" \
		kernel
}

src_install() {
	dodir /usr/src
	echo ">>> Copying sources..."
	cp -a "${S}" "${D}/usr/src/linux-${P}"
	cd "${D}/usr/src/linux-${P}"
	make mrproper
	cp "${T}"/config .config
	yes "" | make oldconfig
	use binary || return
	make prepare
	make scripts
	cp -a "${WORKDIR}/out/*" "${D}/"
	rm -f "${D}"/lib/modules/*/source
	rm -f "${D}"/lib/modules/*/build
	cd "${D}/lib/modules"
	find -iname *.ko -exec strip --strip-debug {} \;
	local moddir="$(ls -d [234]*)"
	ln -s /usr/src/linux-"${P}" "${D}/lib/modules/${moddir}/source"
	ln -s /usr/src/linux-"${P}" "${D}/lib/modules/${moddir}/build"
	cp "${WORKDIR}"/build/System.map" "${D}/usr/src/linux-${P}/"
	cp "${WORKDIR}"/build/Modules.symvers" "${D}/usr/src/linux-${P}/"
}

pkg_postinst() {
	if use binary && [[ -h "${ROOT}usr/src/linux" ]]; then
		rm "${ROOT}usr/src/linux"
	fi

	if use binary && [[ ! -e "${ROOT}usr/src/linux" ]]; then
		ewarn "With binary use flag enabled /usr/src/linux"
		ewarn "symlink automatically set to kodiak kernel"
		ln -sf linux-"${P}" "${ROOT}usr/src/linux"
	fi

	if ! use binary; then
		kernel-2_pkg_postinst
		einfo "For more info on these kernel sources, see:"
		einfo "${HOMEPAGE}"
	fi
}
