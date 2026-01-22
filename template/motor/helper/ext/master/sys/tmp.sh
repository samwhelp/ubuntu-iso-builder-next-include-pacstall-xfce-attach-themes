

################################################################################
### Head: Master / Sys / Tmp
##

sys_tmp_dir_create () {

	#sys_tmp_dir_create_for_main

	sys_tmp_dir_create_for_master

}

sys_tmp_dir_create_for_main () {

	local tmp_dir_path="${REF_MAIN_TMP_DIR_PATH}"

	mkdir -p "${tmp_dir_path}"

}

sys_tmp_dir_create_for_master () {

	local tmp_dir_path="${REF_MASTER_TMP_DIR_PATH}"

	mkdir -p "${tmp_dir_path}"

}

##
### Tail: Master / Sys / Tmp
################################################################################
