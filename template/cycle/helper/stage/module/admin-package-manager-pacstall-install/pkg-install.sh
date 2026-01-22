#!/usr/bin/env bash


#set -e




##
## # Install Theme
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

mod_packaging_install_pkg () {


	local pkgdir="${REF_BUILD_DIR_PATH}/pkg"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"


	echo
	echo mkdir -p "${DESTDIR}"
	mkdir -p "${DESTDIR}"


	echo
	echo cp -rfT "${pkgdir}" "${DESTDIR}"
	cp -rfT "${pkgdir}" "${DESTDIR}"




	return 0
}

mod_packaging_install_deb_control () {


	local src_dir_path="${REF_ASSET_DIR_PATH}/deb-control/DEBIAN"
	local des_dir_path="${DESTDIR}/DEBIAN"



	echo
	echo mkdir -p "${src_dir_path}"
	mkdir -p "${src_dir_path}"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo cp -rfT "${src_dir_path}" "${des_dir_path}"
	cp -rfT "${src_dir_path}" "${des_dir_path}"




	return 0
}


##
## ## Model / Start
##

model_start () {


	echo
	echo "P: install"

	echo
	echo "Shell: DESTDIR=${DESTDIR}"




	mod_packaging_install_pkg

	mod_packaging_install_deb_control




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
