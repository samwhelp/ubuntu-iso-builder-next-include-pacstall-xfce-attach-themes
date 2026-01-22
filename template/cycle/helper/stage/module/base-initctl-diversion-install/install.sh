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
### Head: Model / mod_module_initctl_diversion_install
##

mod_module_initctl_diversion_package_install () {




local run_cmd=$(cat << __EOF__
	apt-get install -y --no-install-recommends
		dpkg
__EOF__
)




	util_error_echo
	util_error_echo $run_cmd
	util_error_echo

	$run_cmd




	return 0
}

mod_module_initctl_diversion_config_install () {


	util_error_echo
	util_error_echo dpkg-divert --local --rename --add /sbin/initctl
	util_error_echo
	dpkg-divert --local --rename --add /sbin/initctl




	if [ -a "/sbin/initctl" ]; then
		util_error_echo
		util_error_echo rm -f "/sbin/initctl"
		util_error_echo
		rm -f "/sbin/initctl"
	fi


	util_error_echo
	util_error_echo ln -sf /bin/true /sbin/initctl
	util_error_echo
	ln -sf /bin/true /sbin/initctl








	#util_error_echo
	#util_error_echo file /sbin/initctl
	#util_error_echo
	#file /sbin/initctl


	util_error_echo
	util_error_echo ls -al /sbin/initctl
	util_error_echo
	ls -al /sbin/initctl || true




	return 0
}

mod_module_initctl_diversion_install () {

	#mod_module_initctl_diversion_package_install

	mod_module_initctl_diversion_config_install

	return 0
}

##
### Tail: Model / mod_module_initctl_diversion_install
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


	mod_module_initctl_diversion_install


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
