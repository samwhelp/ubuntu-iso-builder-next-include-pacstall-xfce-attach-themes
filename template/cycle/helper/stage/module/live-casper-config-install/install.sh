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
### Head: Model / mod_module_casper_config_install
##

mod_module_casper_config_install () {


cat << __EOF__ > /etc/casper.conf

##
## This file should go in /etc/casper.conf
## Supported variables are:
##
## * USERNAME
## * USERFULLNAME
## * HOST
## * BUILD_SYSTEM
## * FLAVOUR
##

export USERNAME="live"
export USERFULLNAME="${REF_BUILD_SUBJECT_TITLE} Live session user"
export HOST="${REF_BUILD_SUBJECT_NAME}"
export BUILD_SYSTEM="Ubuntu"

# USERNAME and HOSTNAME as specified above won't be honoured and will be set to
# flavour string acquired at boot time, unless you set FLAVOUR to any
# non-empty string.

export FLAVOUR="${REF_BUILD_SUBJECT_TITLE}"
__EOF__


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Create /etc/casper.conf"
	util_error_echo "##"
	util_error_echo
	cat /etc/casper.conf




	return 0
}

##
### Tail: Model / mod_module_casper_config_install
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


	mod_module_casper_config_install


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
