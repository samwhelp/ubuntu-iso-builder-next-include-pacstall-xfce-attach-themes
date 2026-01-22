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
### Head: Model / mod_module_locale_config
##

sys_locale_config_locale_conf_via_cmd () {

	local the_locale_lang="LANG=en_US.UTF-8"

	util_error_echo
	util_error_echo echo "${the_locale_lang}" '|' tee /etc/locale.conf
	util_error_echo
	echo "${the_locale_lang}" | tee /etc/locale.conf 2>&1 >/dev/null


	return 0
}

sys_locale_config_locale_gen_via_cmd () {

	local the_locale_gen="en_US.UTF-8 UTF-8"

	util_error_echo
	util_error_echo echo "${the_locale_gen}" '|' tee -a /etc/locale.gen
	util_error_echo
	echo "${the_locale_gen}" | tee -a /etc/locale.gen 2>&1 >/dev/null




	the_locale_gen="C.UTF-8 UTF-8"

	util_error_echo
	util_error_echo echo "${the_locale_gen}" '|' tee -a /etc/locale.gen
	util_error_echo
	echo "${the_locale_gen}" | tee -a /etc/locale.gen 2>&1 >/dev/null



	return 0
}

sys_locale_config_via_cmd () {


	sys_locale_config_locale_conf_via_cmd

	sys_locale_config_locale_gen_via_cmd


	return 0
}

sys_locale_config_via_file () {


	local source_dir_path="${REF_BASE_DIR_PATH}/asset/overlay"
	local target_dir_path="/"

	util_error_echo
	util_error_echo cp -rfT "${source_dir_path}" "${target_dir_path}"
	util_error_echo
	cp -rfT "${source_dir_path}" "${target_dir_path}"


	return 0
}

sys_locale_gen () {


	util_error_echo
	util_error_echo locale-gen
	util_error_echo
	locale-gen


	return 0
}

sys_locale_update () {

	local the_lang="en_US.UTF-8"

	util_error_echo
	util_error_echo update-locale LANG=${the_lang} LC_ALL=${the_lang}
	util_error_echo
	update-locale LANG=${the_lang} LC_ALL=${the_lang}


	return 0
}

mod_module_locale_config () {

	#sys_locale_config_via_cmd

	sys_locale_config_via_file




	sys_locale_gen


	return 0
}

##
### Tail: Model / mod_module_locale_config
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


	mod_module_locale_config


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
