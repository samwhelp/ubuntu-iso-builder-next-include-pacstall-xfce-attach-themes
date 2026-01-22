

################################################################################
### Head: Master / Mod / Stage
##

mod_stage_rundown_process_all () {


	mod_stage_rundown_process_skeleton_head
	mod_stage_rundown_process_custom_head


	mod_stage_rundown_process_factory_install


	mod_stage_rundown_process_basic_install


	mod_stage_rundown_process_skeleton_middle
	mod_stage_rundown_process_custom_middle


	mod_stage_rundown_process_master_install


	mod_stage_rundown_process_installer_install


	mod_stage_rundown_process_custom_tail
	mod_stage_rundown_process_skeleton_tail


}

##
### Tail: Master / Mod / Stage
################################################################################


################################################################################
### Head: Master / Mod / Stage / Package And File Install
##

mod_stage_rundown_process_factory_install () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/factory-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}


mod_stage_rundown_process_master_install () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/master-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

mod_stage_rundown_process_basic_install () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/basic-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

mod_stage_rundown_process_installer_install () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/installer-install.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

##
### Tail: Master / Mod / Stage / Package And File Install
################################################################################


################################################################################
### Head: Master / Mod / Stage / Skeleton
##

mod_stage_rundown_process_skeleton_head () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-head.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_tail () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-tail.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_skeleton_middle () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/skeleton-middle.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

##
### Tail: Master / Mod / Stage / Skeleton
################################################################################


################################################################################
### Head: Master / Mod / Stage / Custom
##

mod_stage_rundown_process_custom_head () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/custom-head.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_custom_tail () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/custom-tail.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}



mod_stage_rundown_process_custom_middle () {

	local module_root_dir_path="${REF_MASTER_STAGE_MODULE_DIR_PATH}"

	local rundown_file_path="${REF_MASTER_STAGE_RUNDOWN_DIR_PATH}/custom-middle.txt"


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Rundown"
	util_error_echo "##"
	util_error_echo
	util_error_echo "[Rundown]: ${rundown_file_path}"
	util_error_echo


	util_stage_rundown_process "${rundown_file_path}" "${module_root_dir_path}"

}

##
### Tail: Master / Mod / Stage / Custom
################################################################################
