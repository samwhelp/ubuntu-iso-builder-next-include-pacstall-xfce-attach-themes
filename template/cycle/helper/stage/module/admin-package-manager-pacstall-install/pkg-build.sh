#!/usr/bin/env bash


#set -e




##
## # Download Project
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


DEFAULT_REPO_URL="https://github.com/pacstall/pacstall.git"
REF_REPO_URL="${REF_REPO_URL:=$DEFAULT_REPO_URL}"


DEFAULT_REPO_BRANCH="master"
REF_REPO_BRANCH="${REF_REPO_BRANCH:=$DEFAULT_REPO_BRANCH}"


REF_REPO_ARCHIVE_EXTRACT_DIR_NAME="${REF_SUBJECT_NAME}-${REF_REPO_BRANCH}"
REF_REPO_ARCHIVE_FILE_NAME="${REF_REPO_BRANCH}.tar.gz"
REF_REPO_ARCHIVE_URL="https://github.com/pacstall/pacstall/archive/refs/heads/${REF_REPO_ARCHIVE_FILE_NAME}"



##
## ## Model / Pacstall
##

mod_project_download () {

	#mod_project_download_via_git_clone

	mod_project_download_via_wget_archive

}

mod_project_download_via_git_clone () {

	echo
	echo git clone -b "${REF_REPO_BRANCH}" "${REF_REPO_URL}" "${prjdir}"
	git clone -b "${REF_REPO_BRANCH}" "${REF_REPO_URL}" "${prjdir}"

}

mod_project_download_via_wget_archive () {

	echo
	echo mkdir -p "${REF_BUILD_DIR_PATH}"
	mkdir -p "${REF_BUILD_DIR_PATH}"

	echo
	echo wget -c "${REF_REPO_ARCHIVE_URL}" -O "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_FILE_NAME}"
	wget -c "${REF_REPO_ARCHIVE_URL}" -O "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_FILE_NAME}"

	echo
	echo tar xf "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_FILE_NAME}" -C "${REF_BUILD_DIR_PATH}"
	tar xf "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_FILE_NAME}" -C "${REF_BUILD_DIR_PATH}"

	echo
	echo mv "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_EXTRACT_DIR_NAME}" "${prjdir}"
	mv "${REF_BUILD_DIR_PATH}/${REF_REPO_ARCHIVE_EXTRACT_DIR_NAME}" "${prjdir}"

}

mod_project_copy_installer () {

	echo
	echo install -Dm755 "${REF_ASSET_DIR_PATH}/installer.sh" "${REF_BUILD_DIR_PATH}/installer.sh"
	install -Dm755 "${REF_ASSET_DIR_PATH}/installer.sh" "${REF_BUILD_DIR_PATH}/installer.sh"

}

mod_project_run_installer () {

	echo
	echo "${REF_BUILD_DIR_PATH}/installer.sh"
	"${REF_BUILD_DIR_PATH}/installer.sh"

}




##
## ## Model / Start
##

model_start () {

	echo "P: build"

	prjdir="${REF_BUILD_DIR_PATH}/prj"

	pkgdir="${REF_BUILD_DIR_PATH}/pkg"



	mod_project_download

	mod_project_copy_installer

	mod_project_run_installer




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
