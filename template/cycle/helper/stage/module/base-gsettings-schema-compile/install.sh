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
### Head: Model / mod_module_gsettings_schema_compile
##

sys_gsettings_package_install () {


	util_error_echo
	util_error_echo apt-get install -y libglib2.0-bin
	util_error_echo
	apt-get install -y libglib2.0-bin


	return 0
}

sys_gsettings_schema_compile () {


	util_error_echo
	util_error_echo glib-compile-schemas /usr/share/glib-2.0/schemas
	util_error_echo
	glib-compile-schemas /usr/share/glib-2.0/schemas


	return 0
}

mod_module_gsettings_schema_compile () {

	sys_gsettings_package_install

	sys_gsettings_schema_compile

	return 0
}

##
### Tail: Model / mod_module_gsettings_schema_compile
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


	mod_module_gsettings_schema_compile


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
