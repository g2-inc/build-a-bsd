#!/bin/sh
#-
# Copyright (c) 2019 Huntington Ingalls Industries
# Author: Shawn Webb <shawn.webb@hii-tsd.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

bab_get_topdir() {
	local self

	[ ! -z "${TOPDIR}" ] && echo ${TOPDIR} && return 0

	self=${1}

	echo $(realpath $(dirname ${self}))
	return ${?}
}

bab_usage() {
	echo "USAGE: ${TOPDIR}/bin/bab.sh verb"
	exit 1
}

_bab_sanity_checks() {
	local verb
	verb=${1}

	case "${verb}" in
		deploy)
			;;
		*)
			bab_usage
			;;
	esac

	return 0
}

TOPDIR=$(realpath $(bab_get_topdir ${0})/..)

main() {
	local res
	local self
	local verb

	self=${1}
	shift

	while getopts 'v' o; do
		case "${o}" in
			v)
				;;
		esac
	done
	shift $((${OPTIND} - 1))

	verb=${1}
	[ -z "${verb}" ] && bab_usage

	_bab_sanity_checks ${verb} || exit 1

	. ${TOPDIR}/lib/verbs/${verb}.sh
	$(echo ${verb}_run) $@
	res=${?}

	return ${res}
}

main ${0} $*
exit ${?}
