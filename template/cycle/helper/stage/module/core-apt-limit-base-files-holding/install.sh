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
### Head: Model / mod_module_base_files_holding
##

sys_base_files_holding () {

	util_error_echo
	util_error_echo apt-mark hold base-files
	util_error_echo
	apt-mark hold base-files


	return 0
}

sys_apt_preferences_no_upgrade_base_files () {

cat << __EOF__ | tee /etc/apt/preferences.d/no-upgrade-base-files.pref 2>&1 >/dev/null
Package: base-files
Pin: release o=Ubuntu
Pin-Priority: -1
__EOF__




	util_error_echo
	util_error_echo cat /etc/apt/preferences.d/no-upgrade-base-files.pref
	util_error_echo
	cat /etc/apt/preferences.d/no-upgrade-base-files.pref




	return 0
}

mod_module_base_files_holding () {

	sys_base_files_holding

	sys_apt_preferences_no_upgrade_base_files


	return 0
}

##
### Tail: Model / mod_module_base_files_holding
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


	mod_module_base_files_holding


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
