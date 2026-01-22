#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/chroot_run.sh
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
### Head: Main / Mod / Signal / Override
##

mod_action_on_exit () {

	sys_action_on_exit

	mod_distro_unmount_for_chroot

	exit 0
}

##
### Tail: Main / Mod / Signal / Override
################################################################################


################################################################################
### Head: Portal / portal_chroot_run
##

portal_chroot_run () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## portal_chroot_run"
	util_error_echo "##"
	util_error_echo


	mod_main_signal_bind

	mod_limit_root_user_required




	mod_chroot_run "${@}"




	return 0
}

##
### Tail: Portal / portal_chroot_run
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_chroot_run "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
