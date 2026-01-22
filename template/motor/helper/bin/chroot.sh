#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/chroot.sh
##

##
### Tail: Note
################################################################################


################################################################################
### Head: Bash
##

set -e						## exit on error
set -o pipefail				## exit on pipeline error
set -u						## treat unset variable as error

##
### Tail: Bash
################################################################################


################################################################################
### Head: Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Portal / portal_chroot
##

portal_chroot () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## portal_chroot"
	util_error_echo "##"
	util_error_echo


	mod_main_signal_bind

	mod_limit_root_user_required




	mod_chroot




	return 0
}

##
### Tail: Portal / portal_chroot
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_chroot "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
