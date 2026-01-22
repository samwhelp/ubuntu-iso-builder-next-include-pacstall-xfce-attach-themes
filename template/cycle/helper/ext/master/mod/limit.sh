


################################################################################
### Head: Master / Mod / Limit
##

mod_limit_root_user_required () {

	if [[ "${EUID}" == 0 ]]; then

		return 0

	else

		util_error_echo
		util_error_echo "##"
		util_error_echo "## ## Root User Required"
		util_error_echo "##"

		util_error_echo
		util_error_echo "> Please Run As Root"
		util_error_echo
		util_error_echo "Example: sudo ./${REF_CMD_FILE_NAME}"
		util_error_echo

		#sleep 2
		exit 0
	fi

}


##
### Tail: Master / Mod / Limit
################################################################################
