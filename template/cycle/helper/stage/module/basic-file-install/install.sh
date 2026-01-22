#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
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
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../../../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Model / mod_module_basic_file_install
##

sys_module_basic_file_install_verbose () {

	local source_dir_path="${REF_MASTER_BASIC_OVERLAY_DIR_PATH}"
	local target_dir_path="/"

	util_error_echo
	util_error_echo cp -rfTv "${source_dir_path}" "${target_dir_path}"
	util_error_echo
	cp -rfTv "${source_dir_path}" "${target_dir_path}"


	return 0

}

sys_module_basic_file_install () {

	local source_dir_path="${REF_MASTER_BASIC_OVERLAY_DIR_PATH}"
	local target_dir_path="/"

	util_error_echo
	util_error_echo cp -rfT "${source_dir_path}" "${target_dir_path}"
	util_error_echo
	cp -rfT "${source_dir_path}" "${target_dir_path}"


	return 0

}

mod_module_basic_file_install () {

	sys_module_basic_file_install

	##sys_module_basic_file_install_verbose

}

##
### Tail: Model / mod_module_basic_file_install
################################################################################


################################################################################
### Head: Portal / portal_install
##

portal_install () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run Module"
	util_error_echo "##"
	util_error_echo

	local script_file_path="${REF_BASE_DIR_PATH}/${REF_CMD_FILE_NAME}"

	util_error_echo "[Run Module]: ${script_file_path}"


	mod_module_basic_file_install


}

##
### Tail: Portal / portal_install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_install "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
