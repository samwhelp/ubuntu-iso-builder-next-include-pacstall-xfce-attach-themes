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
## https://stackoverflow.com/questions/6674327/redirect-all-output-to-file-in-bash
##
## ``` sh
## make 2>&1 | tee file.txt
## ```
##
## ``` sh
## make build 2>&1 | tee log.txt
## ```


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
### Head: Portal / portal_log_build
##

portal_log_build () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## portal_log_build"
	util_error_echo "##"
	util_error_echo




	local log_dir_path="${REF_MASTER_TMP_DIR_PATH}"
	local log_file_path="${REF_MASTER_LOG_FILE_PATH}"


	util_error_echo
	util_error_echo mkdir -p "${log_dir_path}"
	util_error_echo
	mkdir -p "${log_dir_path}"




	local script_file_path="${REF_MAIN_BIN_DIR_PATH}/build.sh"

	util_error_echo
	util_error_echo "${script_file_path}" '2>&1' '|' tee "${log_file_path}"
	util_error_echo

	## ./build.sh" 2>&1 | tee log.txt
	"${script_file_path}" 2>&1 | tee "${log_file_path}"




	return 0

}

##
### Tail: Portal / portal_log_build
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_log_build "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
