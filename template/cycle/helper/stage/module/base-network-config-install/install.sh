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
### Head: Model / mod_module_network_config_install
##

sys_network_config_install_network_manager_via_cmd () {




cat << __EOF__ > /etc/NetworkManager/NetworkManager.conf
[main]
rc-manager=resolvconf
plugins=ifupdown,keyfile
dns=dnsmasq

[ifupdown]
managed=false
__EOF__




	util_error_echo
	util_error_echo cat /etc/NetworkManager/NetworkManager.conf
	util_error_echo
	cat /etc/NetworkManager/NetworkManager.conf




	return 0
}

sys_network_config_install_netplan_via_cmd () {


	util_error_echo
	util_error_echo mkdir -p /etc/netplan
	util_error_echo
	mkdir -p /etc/netplan




cat << __EOF__ > /etc/netplan/01-network-manager-all.yaml
network:
  version: 2
  renderer: NetworkManager
__EOF__




	util_error_echo
	util_error_echo cat /etc/netplan/01-network-manager-all.yaml
	util_error_echo
	cat /etc/netplan/01-network-manager-all.yaml




	return 0
}

sys_network_config_install_via_cmd () {


	sys_network_config_install_network_manager_via_cmd

	sys_network_config_install_netplan_via_cmd


	return 0
}

sys_network_config_install_via_file () {


	local source_dir_path="${REF_BASE_DIR_PATH}/asset/overlay"
	local target_dir_path="/"

	util_error_echo
	util_error_echo cp -rfT "${source_dir_path}" "${target_dir_path}"
	util_error_echo
	cp -rfT "${source_dir_path}" "${target_dir_path}"


	return 0
}


mod_module_network_config_install () {

	sys_network_config_install_via_cmd

	#sys_network_config_install_via_file




	return 0
}

##
### Tail: Model / mod_module_network_config_install
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


	mod_module_network_config_install


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
