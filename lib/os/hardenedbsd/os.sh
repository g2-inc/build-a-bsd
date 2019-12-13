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

os_sanity_checks() {
	local res

	res=0
	case "$(uname)" in
		FreeBSD)
			# We require building on FreeBSD or
			# HardenedBSD.
			;;
		*)
			res=1
			;;
	esac

	[ ! -d ${BAB_SCRATCH_DIR} ] && mkdir -p ${BAB_SCRATCH_DIR}/tmp
	res=${?}; [ ${res} -gt 0 ] && return ${res}

	return ${res}
}

os_host_install_dependencies() {
	return 0
}

os_fetch_distribution() {
	fetch -o ${BAB_SCRATCH_DIR}/tmp/base.txz \
	    ${BAB_DOWNLOAD_BASE_URL}/base.txz
	return ${?}
}

os_extract_rootfs() {
	tar -xpf ${BAB_SCRATCH_DIR}/tmp/base.txz \
	    -C ${BAB_ROOTFS_DIR}
	return ${?}
}

os_guest_preinstall_packages() {
	return 0
}

os_guest_install_packages() {
	return 0
}
