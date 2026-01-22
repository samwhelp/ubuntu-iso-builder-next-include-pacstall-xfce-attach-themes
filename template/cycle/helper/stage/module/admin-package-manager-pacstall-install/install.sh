#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
## * https://github.com/samwhelp/pacstall-packaging/tree/main/recipe/pacstall-packaging-deb/pacstall-packaging-deb
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
### Head: Model / mod_module_pacstall_install
##

sys_pacstall_build_essential () {


	##
	## ## apt-get install -y --no-install-recommends
	##


local run_cmd=$(cat << __EOF__
	apt-get install -y
		dpkg
		gettext
		gzip
__EOF__
)




	util_error_echo
	util_error_echo $run_cmd
	util_error_echo

	$run_cmd




	return 0

}

sys_pacstall_depends () {




local run_cmd=$(cat << __EOF__
	apt-get install -y
		bash
		curl
		wget
		git
		unzip
		zstd
		tar
		gzip
		sensible-utils
		iputils-ping
		lsb-release
		aptitude
		bubblewrap
		build-essential
		jq
		distro-info-data
		gettext
__EOF__
)




	util_error_echo
	util_error_echo $run_cmd
	util_error_echo

	$run_cmd




	return 0
}

sys_pacstall_packaging () {


	util_error_echo
	util_error_echo "${REF_BASE_DIR_PATH}/deb-build.sh"
	util_error_echo
	"${REF_BASE_DIR_PATH}/deb-build.sh"


	return 0
}

sys_pacstall_package_install () {

	local deb_file_path="${REF_BASE_DIR_PATH}/build/deb/pacstall.deb"

	util_error_echo
	util_error_echo dpkg -i "${deb_file_path}"
	util_error_echo
	dpkg -i "${deb_file_path}"

	return 0
}

mod_module_pacstall_install () {

	sys_pacstall_build_essential

	sys_pacstall_depends

	sys_pacstall_packaging

	sys_pacstall_package_install


	return 0
}

##
### Tail: Model / mod_module_pacstall_install
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


	mod_module_pacstall_install


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
