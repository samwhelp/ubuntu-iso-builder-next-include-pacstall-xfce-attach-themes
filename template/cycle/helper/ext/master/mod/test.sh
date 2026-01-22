

################################################################################
### Head: Master / Mod / Test
##

mod_test () {

	#sys_apt_source_list_create_simple_for_build

	#mod_apt_source_list_create_for_build


	return 0

}

mod_test_util_text_file_list_load () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test_util_text_file_list_load"
	util_error_echo "##"
	util_error_echo

	local list_file_path="${REF_MAIN_DIR_PATH}/../../asset/package/install/text-editor.txt"

	echo "${list_file_path}"

	local list=$(util_text_file_list_load "${list_file_path}")

	echo "${list}"

}



mod_test_util_stage_rundown_process () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test_util_stage_rundown_process"
	util_error_echo "##"
	util_error_echo


	mod_stage_rundown_process_all

}


##
### Tail: Master / Mod / Test
################################################################################
