#!/usr/bin/env bash


#set -e




##
## # Remove Build Dir
##




##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"




##
## ## Main / Args
##

DEFAULT_BUILD_DIR_PATH="${REF_BASE_DIR_PATH}/build"
REF_BUILD_DIR_PATH="${REF_BUILD_DIR_PATH:=$DEFAULT_BUILD_DIR_PATH}"




##
## ## Model / Start
##

model_start () {

	echo
	echo "P: clean"

	local build_dir_path="${REF_BUILD_DIR_PATH}"

	echo
	echo rm -rf "${build_dir_path}"
	rm -rf "${build_dir_path}"
	echo




	echo

	return 0

}




##
## ## Main / Start
##

__main__ () {

	model_start "${@}"

}

__main__ "${@}"
