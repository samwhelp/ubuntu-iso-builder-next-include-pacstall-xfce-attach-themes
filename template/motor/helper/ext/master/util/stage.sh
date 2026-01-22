

################################################################################
### Head: Master / Util / Stage
##

util_stage_rundown_process () {

	local rundown_file_path="${1}"

	local module_root_dir_path="${2}"


	if ! [ -f "${rundown_file_path}" ]; then
		util_error_echo
		util_error_echo "[Rundown File Not Exists]: util_stage_rundown_process ${rundown_file_path} ${module_root_dir_path}"
		util_error_echo
		return 0
	fi


	if [ -z "${module_root_dir_path}" ]; then
		util_error_echo
		util_error_echo "[Empty Args, Modules Dir]: util_stage_rundown_process ${rundown_file_path} ${module_root_dir_path}"
		util_error_echo
		return 0
	fi


	if ! [ -d "${module_root_dir_path}" ]; then
		util_error_echo
		util_error_echo "[Modules Dir Not Exists]: util_stage_rundown_process ${rundown_file_path} ${module_root_dir_path}"
		util_error_echo
		return 0
	fi




	local module_name_list="$(util_text_file_list_load "${rundown_file_path}")"

	#echo "${module_name_list}"

	local module_name=""
	local module_dir_path=""

	local module_install_file_name="install.sh"
	local module_install_file_path=""


	for module_name in ${module_name_list}; do

		module_dir_path="${module_root_dir_path}/${module_name}"
		module_install_file_path="${module_dir_path}/${module_install_file_name}"

		if [ -x "${module_install_file_path}" ]; then
			util_error_echo
			util_error_echo
			util_error_echo "##"
			util_error_echo "## ## Module"
			util_error_echo "##"
			util_error_echo
			util_error_echo "[Call]: ${module_install_file_path}"
			util_error_echo
			${module_install_file_path}

		else
			util_error_echo
			util_error_echo
			util_error_echo "##"
			util_error_echo "## ## Module"
			util_error_echo "##"
			util_error_echo
			util_error_echo "[Skip]: ${module_install_file_path}"
			util_error_echo
		fi

	done

}


##
### Tail: Master / Util / Stage
################################################################################
