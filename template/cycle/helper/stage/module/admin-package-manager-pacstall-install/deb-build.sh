#!/usr/bin/env bash


#set -e




##
## # Build Deb
##




##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"




##
## ## Main / Args
##

DEFAULT_ASSET_DIR_PATH="${REF_BASE_DIR_PATH}/asset"
REF_ASSET_DIR_PATH="${REF_ASSET_DIR_PATH:=$DEFAULT_ASSET_DIR_PATH}"


DEFAULT_BUILD_DIR_PATH="${REF_BASE_DIR_PATH}/build"
REF_BUILD_DIR_PATH="${REF_BUILD_DIR_PATH:=$DEFAULT_BUILD_DIR_PATH}"


DEFAULT_SUBJECT_NAME="pacstall"
REF_SUBJECT_NAME="${REF_SUBJECT_NAME:=$DEFAULT_SUBJECT_NAME}"


DEFAULT_DEB_DIR_PATH="${REF_BUILD_DIR_PATH}/deb"
REF_DEB_DIR_PATH="${REF_DEB_DIR_PATH:=$DEFAULT_DEB_DIR_PATH}"


DEFAULT_DESTDIR="${REF_DEB_DIR_PATH}/${REF_SUBJECT_NAME}"
DESTDIR="${DESTDIR:=$DEFAULT_DESTDIR}"




##
## ## Model / Packaging
##

mod_packaging_prepare () {


	local deb_dir_path="${REF_DEB_DIR_PATH}"


	echo ${deb_dir_path}

	if [ -e "${deb_dir_path}" ]; then
		echo
		echo rm -rf "${deb_dir_path}"
		rm -rf "${deb_dir_path}"
	fi


	echo
	echo mkdir -p "${deb_dir_path}"
	mkdir -p "${deb_dir_path}"




	return 0
}

mod_packaging_start () {


	"${REF_BASE_DIR_PATH}/pkg-clean.sh"

	"${REF_BASE_DIR_PATH}/pkg-build.sh"

	"${REF_BASE_DIR_PATH}/pkg-install.sh"



	return 0
}

mod_packaging_run () {

	local deb_dir_path="${DESTDIR}"


	echo
	echo dpkg-deb --root-owner-group --build "${deb_dir_path}"
	dpkg-deb --root-owner-group --build "${deb_dir_path}"
	echo




	return 0
}




##
## ## Model / Start
##

model_start () {

	echo
	echo "P: deb-build"



	#mod_packaging_prepare

	mod_packaging_start

	mod_packaging_run




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
