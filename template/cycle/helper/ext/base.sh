

################################################################################
### Head: Debug
##

DEFAULT_IS_DEBUG=false
IS_DEBUG="${IS_DEBUG:=$DEFAULT_IS_DEBUG}"

##
### Head: Debug
################################################################################


################################################################################
### Head: Util / Debug
##

util_debug_echo () {

	if is_debug; then
		echo "${@}" 1>&2
	fi

}

util_error_echo () {

	echo "${@}" 1>&2

}

##
### Head: Util / Debug
################################################################################


################################################################################
### Head: Base
##

##
## REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
##

find_dir_path () {

	if ! [ -d "$(dirname -- "${1}")" ]; then
		dirname -- "${1}"
		return 1
	fi
	echo "$(cd -- "$(dirname -- "${1}")" ; pwd)"

}

##
## THIS_BASE_DIR_PATH="$(find_dir_path "${0}")"
##


##
## $ export IS_DEBUG=true
##

is_debug () {

	if [ "${IS_DEBUG}" = "true" ]; then
		return 0
	fi

	return 1

}

is_not_debug () {

	! is_debug

}

base_var_init () {

	##
	## ## Base Path
	##

	REF_INIT_DIR_PATH="$(find_dir_path "${REF_INIT_DIR_PATH}/-")"
	REF_PLAN_DIR_PATH="$(find_dir_path "${REF_INIT_DIR_PATH}/../../-")"
	REF_SUIT_DIR_PATH="$(find_dir_path "${REF_INIT_DIR_PATH}/../../../../-")"




	##
	## ## Main Path
	##

	REF_MAIN_DIR_NAME="helper"
	REF_MAIN_DIR_PATH="${REF_PLAN_DIR_PATH}/${REF_MAIN_DIR_NAME}"


	##
	## ## Main Path / Sub
	##

	REF_MAIN_BIN_DIR_NAME="bin"
	REF_MAIN_BIN_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_BIN_DIR_NAME}"

	REF_MAIN_EXT_DIR_NAME="ext"
	REF_MAIN_EXT_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_EXT_DIR_NAME}"

	REF_MAIN_MAK_DIR_NAME="mak"
	REF_MAIN_MAK_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_MAK_DIR_NAME}"

	REF_MAIN_SYS_DIR_NAME="sys"
	REF_MAIN_SYS_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_SYS_DIR_NAME}"

	REF_MAIN_SHARE_DIR_NAME="share"
	REF_MAIN_SHARE_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_SHARE_DIR_NAME}"

	REF_MAIN_STAGE_DIR_NAME="stage"
	REF_MAIN_STAGE_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_STAGE_DIR_NAME}"

	REF_MAIN_TMP_DIR_NAME="tmp"
	REF_MAIN_TMP_DIR_PATH="${REF_MAIN_DIR_PATH}/${REF_MAIN_TMP_DIR_NAME}"




	##
	## ## Main Path / Ext / Main
	##

	REF_MAIN_EXT_MAIN_DIR_NAME="main"
	REF_MAIN_EXT_MAIN_DIR_PATH="${REF_MAIN_EXT_DIR_PATH}/${REF_MAIN_EXT_MAIN_DIR_NAME}"


	##
	## ## Main Path / Ext / Main / Sub
	##

	REF_MAIN_EXT_MAIN_UTIL_DIR_NAME="util"
	REF_MAIN_EXT_MAIN_UTIL_DIR_PATH="${REF_MAIN_EXT_MAIN_DIR_PATH}/${REF_MAIN_EXT_MAIN_UTIL_DIR_NAME}"

	REF_MAIN_EXT_MAIN_SYS_DIR_NAME="sys"
	REF_MAIN_EXT_MAIN_SYS_DIR_PATH="${REF_MAIN_EXT_MAIN_DIR_PATH}/${REF_MAIN_EXT_MAIN_SYS_DIR_NAME}"

	REF_MAIN_EXT_MAIN_MOD_DIR_NAME="mod"
	REF_MAIN_EXT_MAIN_MOD_DIR_PATH="${REF_MAIN_EXT_MAIN_DIR_PATH}/${REF_MAIN_EXT_MAIN_MOD_DIR_NAME}"




	##
	## ## Main Path / Ext / Master
	##

	REF_MAIN_EXT_MASTER_DIR_NAME="master"
	REF_MAIN_EXT_MASTER_DIR_PATH="${REF_MAIN_EXT_DIR_PATH}/${REF_MAIN_EXT_MASTER_DIR_NAME}"


	##
	## ## Main Path / Ext / Master / Sub
	##

	REF_MAIN_EXT_MASTER_UTIL_DIR_NAME="util"
	REF_MAIN_EXT_MASTER_UTIL_DIR_PATH="${REF_MAIN_EXT_MASTER_DIR_PATH}/${REF_MAIN_EXT_MASTER_UTIL_DIR_NAME}"

	REF_MAIN_EXT_MASTER_SYS_DIR_NAME="sys"
	REF_MAIN_EXT_MASTER_SYS_DIR_PATH="${REF_MAIN_EXT_MASTER_DIR_PATH}/${REF_MAIN_EXT_MASTER_SYS_DIR_NAME}"

	REF_MAIN_EXT_MASTER_MOD_DIR_NAME="mod"
	REF_MAIN_EXT_MASTER_MOD_DIR_PATH="${REF_MAIN_EXT_MASTER_DIR_PATH}/${REF_MAIN_EXT_MASTER_MOD_DIR_NAME}"




	##
	############################################################################
	##




	##
	## ## Master Path / Stage / Sub
	##

	REF_MASTER_STAGE_MODULE_DIR_NAME="module"
	REF_MASTER_STAGE_MODULE_DIR_PATH="${REF_MAIN_STAGE_DIR_PATH}/${REF_MASTER_STAGE_MODULE_DIR_NAME}"

	REF_MASTER_STAGE_RUNDOWN_DIR_NAME="rundown"
	REF_MASTER_STAGE_RUNDOWN_DIR_PATH="${REF_MAIN_STAGE_DIR_PATH}/${REF_MASTER_STAGE_RUNDOWN_DIR_NAME}"




	##
	############################################################################
	##




	##
	## ## Master Path
	##

	##REF_MASTER_DIR_PATH="${REF_PLAN_DIR_PATH}"
	REF_MASTER_DIR_PATH="$(find_dir_path "${REF_PLAN_DIR_PATH}/../-")"


	##
	## ## Master Path / Tmp
	##

	REF_MASTER_TMP_DIR_NAME="tmp"
	#REF_MASTER_TMP_DIR_PATH="${REF_SUIT_DIR_PATH}/${REF_MASTER_TMP_DIR_NAME}"
	REF_MASTER_TMP_DIR_PATH="${REF_MAIN_TMP_DIR_PATH}"


	##
	## ## Master Path / Log
	##

	REF_MASTER_LOG_FILE_NAME="log.txt"
	REF_MASTER_LOG_FILE_PATH="${REF_MASTER_TMP_DIR_PATH}/${REF_MASTER_LOG_FILE_NAME}"


	##
	## ## Master Path / Sub
	##

	REF_MASTER_ASSET_DIR_NAME="asset"
	REF_MASTER_ASSET_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_ASSET_DIR_NAME}"

	REF_MASTER_FACTORY_DIR_NAME="factory"
	REF_MASTER_FACTORY_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_FACTORY_DIR_NAME}"

	REF_MASTER_BASIC_DIR_NAME="basic"
	REF_MASTER_BASIC_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_BASIC_DIR_NAME}"

	REF_MASTER_INSTALLER_DIR_NAME="installer"
	REF_MASTER_INSTALLER_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_INSTALLER_DIR_NAME}"

	REF_MASTER_MOTOR_DIR_NAME="motor"
	REF_MASTER_MOTOR_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_MOTOR_DIR_NAME}"

	REF_MASTER_CYCLE_DIR_NAME="cycle"
	REF_MASTER_CYCLE_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_CYCLE_DIR_NAME}"

	REF_MASTER_OPTION_DIR_NAME="option"
	REF_MASTER_OPTION_DIR_PATH="${REF_MASTER_DIR_PATH}/${REF_MASTER_OPTION_DIR_NAME}"


	##
	## ## Master Path / Option / Sub
	##

	REF_MASTER_OPTION_ARGS_FILE_NAME="args.sh"
	REF_MASTER_OPTION_ARGS_FILE_PATH="${REF_MASTER_OPTION_DIR_PATH}/${REF_MASTER_OPTION_ARGS_FILE_NAME}"

	REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_NAME="args.override.sh"
	REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_PATH="${REF_MASTER_OPTION_DIR_PATH}/${REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_NAME}"


	##
	## ## Master Path / Asset / Sub
	##

	REF_MASTER_ASSET_OVERLAY_DIR_NAME="overlay"
	REF_MASTER_ASSET_OVERLAY_DIR_PATH="${REF_MASTER_ASSET_DIR_PATH}/${REF_MASTER_ASSET_OVERLAY_DIR_NAME}"

	REF_MASTER_ASSET_PACKAGE_DIR_NAME="package"
	REF_MASTER_ASSET_PACKAGE_DIR_PATH="${REF_MASTER_ASSET_DIR_PATH}/${REF_MASTER_ASSET_PACKAGE_DIR_NAME}"

	REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_NAME="install"
	REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_PATH="${REF_MASTER_ASSET_PACKAGE_DIR_PATH}/${REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_NAME}"


	##
	## ## Master Path / Factory / Sub
	##

	REF_MASTER_FACTORY_OVERLAY_DIR_NAME="overlay"
	REF_MASTER_FACTORY_OVERLAY_DIR_PATH="${REF_MASTER_FACTORY_DIR_PATH}/${REF_MASTER_FACTORY_OVERLAY_DIR_NAME}"

	REF_MASTER_FACTORY_PACKAGE_DIR_NAME="package"
	REF_MASTER_FACTORY_PACKAGE_DIR_PATH="${REF_MASTER_FACTORY_DIR_PATH}/${REF_MASTER_FACTORY_PACKAGE_DIR_NAME}"

	REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_NAME="install"
	REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_PATH="${REF_MASTER_FACTORY_PACKAGE_DIR_PATH}/${REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_NAME}"

	REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_NAME="remove"
	REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_PATH="${REF_MASTER_FACTORY_PACKAGE_DIR_PATH}/${REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_NAME}"


	##
	## ## Master Path / Basic / Sub
	##

	REF_MASTER_BASIC_OVERLAY_DIR_NAME="overlay"
	REF_MASTER_BASIC_OVERLAY_DIR_PATH="${REF_MASTER_BASIC_DIR_PATH}/${REF_MASTER_BASIC_OVERLAY_DIR_NAME}"

	REF_MASTER_BASIC_PACKAGE_DIR_NAME="package"
	REF_MASTER_BASIC_PACKAGE_DIR_PATH="${REF_MASTER_BASIC_DIR_PATH}/${REF_MASTER_BASIC_PACKAGE_DIR_NAME}"

	REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_NAME="install"
	REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_PATH="${REF_MASTER_BASIC_PACKAGE_DIR_PATH}/${REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_NAME}"


	##
	## ## Master Path / Installer / Sub
	##

	REF_MASTER_INSTALLER_OVERLAY_DIR_NAME="overlay"
	REF_MASTER_INSTALLER_OVERLAY_DIR_PATH="${REF_MASTER_INSTALLER_DIR_PATH}/${REF_MASTER_INSTALLER_OVERLAY_DIR_NAME}"

	REF_MASTER_INSTALLER_PACKAGE_DIR_NAME="package"
	REF_MASTER_INSTALLER_PACKAGE_DIR_PATH="${REF_MASTER_INSTALLER_DIR_PATH}/${REF_MASTER_INSTALLER_PACKAGE_DIR_NAME}"

	REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_NAME="install"
	REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_PATH="${REF_MASTER_INSTALLER_PACKAGE_DIR_PATH}/${REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_NAME}"








	##
	## ## Locale
	##

	REF_BUILD_LOCALE_NAME="en_US.UTF-8"

	REF_BUILD_LOCALE_NAME_PART_MAIN="en_US"
	REF_BUILD_LOCALE_NAME_PART_LANGUAGE="en"
	REF_BUILD_LOCALE_NAME_PART_TERRITORY="US"

	REF_BUILD_LOCALE_NAME_PART_CODESET="UTF-8"


	REF_BUILD_LOCALE_GEN="en_US.UTF-8 zh_TW.UTF-8 zh_CN.UTF-8 zh_HK.UTF-8 ja_JP.UTF-8 ko_KR.UTF-8"


	## /usr/share/zoneinfo/Etc/UTC
	REF_BUILD_TIMEZONE="Etc/UTC"

	## /usr/share/zoneinfo/Asia/Taipei
	#REF_BUILD_TIMEZONE="Asia/Taipei"








	return 0

}

base_var_dump () {

	is_not_debug && return 0

	util_debug_echo
	util_debug_echo "################################################################################"
	util_debug_echo "### Head: base_var_dump"
	util_debug_echo "##"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Note"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "##"
	util_debug_echo "## **Hide This Info**"
	util_debug_echo "##"
	util_debug_echo "## \$ export IS_DEBUG=false"
	util_debug_echo "##"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Base Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_BASE_DIR_PATH=${REF_BASE_DIR_PATH}"
	util_debug_echo "REF_INIT_DIR_PATH=${REF_INIT_DIR_PATH}"
	util_debug_echo "REF_PLAN_DIR_PATH=${REF_PLAN_DIR_PATH}"
	util_debug_echo "REF_SUIT_DIR_PATH=${REF_SUIT_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_DIR_NAME=${REF_MAIN_DIR_NAME}"
	util_debug_echo "REF_MAIN_DIR_PATH=${REF_MAIN_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_BIN_DIR_NAME=${REF_MAIN_BIN_DIR_NAME}"
	util_debug_echo "REF_MAIN_BIN_DIR_PATH=${REF_MAIN_BIN_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_DIR_NAME=${REF_MAIN_EXT_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_DIR_PATH=${REF_MAIN_EXT_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_MAK_DIR_NAME=${REF_MAIN_MAK_DIR_NAME}"
	util_debug_echo "REF_MAIN_MAK_DIR_PATH=${REF_MAIN_MAK_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_SYS_DIR_NAME=${REF_MAIN_SYS_DIR_NAME}"
	util_debug_echo "REF_MAIN_SYS_DIR_PATH=${REF_MAIN_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_SHARE_DIR_NAME=${REF_MAIN_SHARE_DIR_NAME}"
	util_debug_echo "REF_MAIN_SHARE_DIR_PATH=${REF_MAIN_SHARE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_STAGE_DIR_NAME=${REF_MAIN_STAGE_DIR_NAME}"
	util_debug_echo "REF_MAIN_STAGE_DIR_PATH=${REF_MAIN_STAGE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_TMP_DIR_NAME=${REF_MAIN_TMP_DIR_NAME}"
	util_debug_echo "REF_MAIN_TMP_DIR_PATH=${REF_MAIN_TMP_DIR_PATH}"
	util_debug_echo




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Main"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MAIN_DIR_NAME=${REF_MAIN_EXT_MAIN_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MAIN_DIR_PATH=${REF_MAIN_EXT_MAIN_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Main / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MAIN_UTIL_DIR_NAME=${REF_MAIN_EXT_MAIN_UTIL_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MAIN_UTIL_DIR_PATH=${REF_MAIN_EXT_MAIN_UTIL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MAIN_SYS_DIR_NAME=${REF_MAIN_EXT_MAIN_SYS_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MAIN_SYS_DIR_PATH=${REF_MAIN_EXT_MAIN_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MAIN_MOD_DIR_NAME=${REF_MAIN_EXT_MAIN_MOD_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MAIN_MOD_DIR_PATH=${REF_MAIN_EXT_MAIN_MOD_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Master"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MASTER_DIR_NAME=${REF_MAIN_EXT_MASTER_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MASTER_DIR_PATH=${REF_MAIN_EXT_MASTER_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Main Path / Ext / Master / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MASTER_UTIL_DIR_NAME=${REF_MAIN_EXT_MASTER_UTIL_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MASTER_UTIL_DIR_PATH=${REF_MAIN_EXT_MASTER_UTIL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MASTER_SYS_DIR_NAME=${REF_MAIN_EXT_MASTER_SYS_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MASTER_SYS_DIR_PATH=${REF_MAIN_EXT_MASTER_SYS_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MAIN_EXT_MASTER_MOD_DIR_NAME=${REF_MAIN_EXT_MASTER_MOD_DIR_NAME}"
	util_debug_echo "REF_MAIN_EXT_MASTER_MOD_DIR_PATH=${REF_MAIN_EXT_MASTER_MOD_DIR_PATH}"
	util_debug_echo




	##
	############################################################################
	##




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Stage / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_STAGE_MODULE_DIR_NAME=${REF_MASTER_STAGE_MODULE_DIR_NAME}"
	util_debug_echo "REF_MASTER_STAGE_MODULE_DIR_PATH=${REF_MASTER_STAGE_MODULE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_STAGE_RUNDOWN_DIR_NAME=${REF_MASTER_STAGE_RUNDOWN_DIR_NAME}"
	util_debug_echo "REF_MASTER_STAGE_RUNDOWN_DIR_PATH=${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}"
	util_debug_echo




	##
	############################################################################
	##




	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_DIR_PATH=${REF_MASTER_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Tmp"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_TMP_DIR_NAME=${REF_MASTER_TMP_DIR_NAME}"
	util_debug_echo "REF_MASTER_TMP_DIR_PATH=${REF_MASTER_TMP_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Log"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_LOG_FILE_NAME=${REF_MASTER_LOG_FILE_NAME}"
	util_debug_echo "REF_MASTER_LOG_FILE_PATH=${REF_MASTER_LOG_FILE_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_ASSET_DIR_NAME=${REF_MASTER_ASSET_DIR_NAME}"
	util_debug_echo "REF_MASTER_ASSET_DIR_PATH=${REF_MASTER_ASSET_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_FACTORY_DIR_NAME=${REF_MASTER_FACTORY_DIR_NAME}"
	util_debug_echo "REF_MASTER_FACTORY_DIR_PATH=${REF_MASTER_FACTORY_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_BASIC_DIR_NAME=${REF_MASTER_BASIC_DIR_NAME}"
	util_debug_echo "REF_MASTER_BASIC_DIR_PATH=${REF_MASTER_BASIC_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_INSTALLER_DIR_NAME=${REF_MASTER_INSTALLER_DIR_NAME}"
	util_debug_echo "REF_MASTER_INSTALLER_DIR_PATH=${REF_MASTER_INSTALLER_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_MOTOR_DIR_NAME=${REF_MASTER_MOTOR_DIR_NAME}"
	util_debug_echo "REF_MASTER_MOTOR_DIR_PATH=${REF_MASTER_MOTOR_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_CYCLE_DIR_NAME=${REF_MASTER_CYCLE_DIR_NAME}"
	util_debug_echo "REF_MASTER_CYCLE_DIR_PATH=${REF_MASTER_CYCLE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_OPTION_DIR_NAME=${REF_MASTER_OPTION_DIR_NAME}"
	util_debug_echo "REF_MASTER_OPTION_DIR_PATH=${REF_MASTER_OPTION_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Option / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_OPTION_ARGS_FILE_NAME=${REF_MASTER_OPTION_ARGS_FILE_NAME}"
	util_debug_echo "REF_MASTER_OPTION_ARGS_FILE_PATH=${REF_MASTER_OPTION_ARGS_FILE_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_NAME=${REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_NAME}"
	util_debug_echo "REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_PATH=${REF_MASTER_OPTION_ARGS_OVERRIDE_FILE_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Asset / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_ASSET_OVERLAY_DIR_NAME=${REF_MASTER_ASSET_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_MASTER_ASSET_OVERLAY_DIR_PATH=${REF_MASTER_ASSET_OVERLAY_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_ASSET_PACKAGE_DIR_NAME=${REF_MASTER_ASSET_PACKAGE_DIR_NAME}"
	util_debug_echo "REF_MASTER_ASSET_PACKAGE_DIR_PATH=${REF_MASTER_ASSET_PACKAGE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_NAME=${REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_NAME}"
	util_debug_echo "REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_PATH=${REF_MASTER_ASSET_PACKAGE_INSTALL_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Factory / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_FACTORY_OVERLAY_DIR_NAME=${REF_MASTER_FACTORY_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_MASTER_FACTORY_OVERLAY_DIR_PATH=${REF_MASTER_FACTORY_OVERLAY_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_DIR_NAME=${REF_MASTER_FACTORY_PACKAGE_DIR_NAME}"
	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_DIR_PATH=${REF_MASTER_FACTORY_PACKAGE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_NAME=${REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_NAME}"
	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_PATH=${REF_MASTER_FACTORY_PACKAGE_INSTALL_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_NAME=${REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_NAME}"
	util_debug_echo "REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_PATH=${REF_MASTER_FACTORY_PACKAGE_REMOVE_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Basic / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_BASIC_OVERLAY_DIR_NAME=${REF_MASTER_BASIC_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_MASTER_BASIC_OVERLAY_DIR_PATH=${REF_MASTER_BASIC_OVERLAY_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_BASIC_PACKAGE_DIR_NAME=${REF_MASTER_BASIC_PACKAGE_DIR_NAME}"
	util_debug_echo "REF_MASTER_BASIC_PACKAGE_DIR_PATH=${REF_MASTER_BASIC_PACKAGE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_NAME=${REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_NAME}"
	util_debug_echo "REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_PATH=${REF_MASTER_BASIC_PACKAGE_INSTALL_DIR_PATH}"
	util_debug_echo


	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Master Path / Installer / Sub"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_MASTER_INSTALLER_OVERLAY_DIR_NAME=${REF_MASTER_INSTALLER_OVERLAY_DIR_NAME}"
	util_debug_echo "REF_MASTER_INSTALLER_OVERLAY_DIR_PATH=${REF_MASTER_INSTALLER_OVERLAY_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_INSTALLER_PACKAGE_DIR_NAME=${REF_MASTER_INSTALLER_PACKAGE_DIR_NAME}"
	util_debug_echo "REF_MASTER_INSTALLER_PACKAGE_DIR_PATH=${REF_MASTER_INSTALLER_PACKAGE_DIR_PATH}"
	util_debug_echo

	util_debug_echo "REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_NAME=${REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_NAME}"
	util_debug_echo "REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_PATH=${REF_MASTER_INSTALLER_PACKAGE_INSTALL_DIR_PATH}"
	util_debug_echo








	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "## ## Locale"
	util_debug_echo "##"
	util_debug_echo

	util_debug_echo "REF_BUILD_LOCALE_NAME=${REF_BUILD_LOCALE_NAME}"
	util_debug_echo

	util_debug_echo "REF_BUILD_LOCALE_NAME_PART_MAIN=${REF_BUILD_LOCALE_NAME_PART_MAIN}"
	util_debug_echo "REF_BUILD_LOCALE_NAME_PART_LANGUAGE=${REF_BUILD_LOCALE_NAME_PART_LANGUAGE}"
	util_debug_echo "REF_BUILD_LOCALE_NAME_PART_TERRITORY=${REF_BUILD_LOCALE_NAME_PART_TERRITORY}"
	util_debug_echo

	util_debug_echo "REF_BUILD_LOCALE_NAME_PART_CODESET=${REF_BUILD_LOCALE_NAME_PART_CODESET}"
	util_debug_echo

	util_debug_echo "REF_BUILD_LOCALE_GEN=${REF_BUILD_LOCALE_GEN}"
	util_debug_echo "REF_BUILD_TIMEZONE=${REF_BUILD_TIMEZONE}"
	util_debug_echo








	util_debug_echo
	util_debug_echo "##"
	util_debug_echo "### Tail: base_var_dump"
	util_debug_echo "################################################################################"
	util_debug_echo


	util_debug_echo
	util_debug_echo
	util_debug_echo


	return 0

}

##
### Tail: Base
################################################################################
