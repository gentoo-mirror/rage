# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: android.eclass
# @MAINTAINER:
# Lucas Ramage <ramage.lucas@protonmail.com>
# @AUTHOR:
# Lucas Ramage <ramage.lucas@protonmail.com>
# @SUPPORTED_EAPIS: 7
# @BLURB: A simple eclass to build Android packages using the sdk.
# @DESCRIPTION:
# A simple eclass to build Android packages using the sdk.

case "${EAPI:-0}" in
	7) ;;
	*)
		die "EAPI ${EAPI} is not supported, contact eclass maintainers";;
esac

DEPEND="
	dev-util/android-commandlinetools-bin
"

QA_FLAGS_IGNORED='.*'

RESTRICT="strip"

# https://developer.android.com/studio/command-line/variables

# @ECLASS-VARIABLE: ANDROID_SDK_ROOT
# @DESCRIPTION:
# The path to the SDK installation directory.
: ${ANDROID_SDK_ROOT:="/opt/android-sdk"}

# @ECLASS-VARIABLE: ANDROID_HOME
# @DESCRIPTION:
# Also points to the SDK installation directory; deprecated in favor of the former.
: ${ANDROID_HOME:="${ANDROID_SDK_ROOT}"}

# @FUNCTION: doapk
# @USAGE: <apk-file>
# @DESCRIPTION:
# Install the given .apk file into the appropriate location.
doapk() {
	[[ -z "${1}" ]] && die "usage: doapk <apk-file>"
	if use android ; then
		pm install "$1" || die "Failed to install ${1}"
	fi
}
