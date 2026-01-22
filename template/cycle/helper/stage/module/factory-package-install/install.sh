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
### Head: PATH
##

THE_FACTORY_PACKAGE_INSTALL_FILE_PATH="${REF_MASTER_TMP_DIR_PATH}/factory-package-install.txt"

##
### Tail: PATH
################################################################################


################################################################################
### Head: Model / mod_module_factory_package_install
##

sys_module_factory_package_update () {

	util_error_echo
	util_error_echo apt-get update
	util_error_echo
	apt-get update

}


sys_module_factory_package_install_combine_list () {

	sys_tmp_dir_create

	local tmp_dir_path="${REF_MASTER_TMP_DIR_PATH}"

	local package_install_file_path="${THE_FACTORY_PACKAGE_INSTALL_FILE_PATH}"

	local package_install_dir_path="${REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_PATH}"

	cat "${package_install_dir_path}"/*.txt > "${package_install_file_path}"


	return 0

}


sys_module_factory_package_install_load_list () {

	local package_install_file_path="${THE_FACTORY_PACKAGE_INSTALL_FILE_PATH}"

	util_text_file_list_load "${package_install_file_path}"

	return 0

}

sys_module_factory_package_install () {

	##util_error_echo
	##util_error_echo apt-get install -y --no-install-recommends $(sys_module_factory_package_install_load_list)
	##util_error_echo
	##apt-get install -y --no-install-recommends $(sys_module_factory_package_install_load_list)


	local package_install_list=$(sys_module_factory_package_install_load_list)

	util_error_echo
	util_error_echo apt-get install -y --no-install-recommends ${package_install_list}
	util_error_echo
	apt-get install -y --no-install-recommends ${package_install_list}


	return 0

}

mod_module_factory_package_install () {

	sys_module_factory_package_update

	sys_module_factory_package_install_combine_list

	sys_module_factory_package_install

}

##
### Tail: Model / mod_module_factory_package_install
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


	mod_module_factory_package_install


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
