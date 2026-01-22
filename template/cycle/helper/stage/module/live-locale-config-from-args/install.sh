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
### Head: Path
##

THE_LOCALE_GEN_FILE_PATH="${REF_BASE_DIR_PATH}/asset/overlay/etc/locale.gen"

##
### Tail: Path
################################################################################


################################################################################
### Head: Model / mod_module_locale_config
##

sys_locale_config_locale_conf () {

	local the_lang="${1}"
	local the_locale_lang="LANG=${the_lang}"


	util_error_echo
	util_error_echo "## the_lang=${the_lang}"
	util_error_echo




	util_error_echo
	util_error_echo echo "${the_locale_lang}" '|' tee /etc/locale.conf
	util_error_echo
	echo "${the_locale_lang}" | tee /etc/locale.conf 2>&1 >/dev/null


	util_error_echo
	util_error_echo cat /etc/locale.conf
	util_error_echo
	cat /etc/locale.conf




	return 0
}

sys_locale_config_locale_gen () {

	local the_locale_gen=${@}

	util_error_echo
	util_error_echo "## the_locale_gen=${the_locale_gen}"
	util_error_echo




cat << __EOF__ | tee -a /etc/locale.gen 2>&1 >/dev/null

##
## ## Extra
##

__EOF__




	local the_item=""

	for the_item in ${the_locale_gen}; do

		util_error_echo
		util_error_echo echo "${the_item}" "UTF-8" '|' tee -a /etc/locale.gen
		util_error_echo
		echo "${the_item}" "UTF-8" | tee -a /etc/locale.gen 2>&1 >/dev/null


	done




	return 0
}

sys_locale_config_timezone () {

	local the_timezone="${1}"


	util_error_echo
	util_error_echo "## the_timezone=${the_timezone}"
	util_error_echo




	if [ -f /etc/localtime ]; then

		util_error_echo
		util_error_echo "rm -f /etc/localtime"
		util_error_echo
		rm -f /etc/localtime

	fi


	util_error_echo
	util_error_echo ln -sf /usr/share/zoneinfo/${the_timezone} /etc/localtime
	util_error_echo
	ln -sf /usr/share/zoneinfo/${the_timezone} /etc/localtime


	util_error_echo
	util_error_echo "ls -al /etc/localtime"
	util_error_echo
	ls -al /etc/localtime




	util_error_echo
	util_error_echo echo "${the_timezone}" '|' tee /etc/timezone
	util_error_echo
	echo "${the_timezone}" | tee /etc/timezone 2>&1 >/dev/null


	util_error_echo
	util_error_echo cat /etc/timezone
	util_error_echo
	cat /etc/timezone




	return 0
}

sys_locale_config_from_args () {


	local the_lang="${REF_BUILD_LOCALE_NAME}"
	local the_locale_gen="${REF_BUILD_LOCALE_GEN}"
	local the_timezone="${REF_BUILD_TIMEZONE}"


	sys_locale_config_locale_conf "${the_lang}"

	sys_locale_config_locale_gen "${the_locale_gen}"

	sys_locale_config_timezone "${the_timezone}"

	return 0
}

sys_locale_config_via_file () {


	local source_dir_path="${REF_BASE_DIR_PATH}/asset/overlay"
	local target_dir_path="/"

	util_error_echo
	util_error_echo cp -rfT "${source_dir_path}" "${target_dir_path}"
	util_error_echo
	cp -rfT "${source_dir_path}" "${target_dir_path}"


	return 0
}

sys_locale_gen () {


	util_error_echo
	util_error_echo locale-gen
	util_error_echo
	locale-gen


	return 0
}

sys_locale_update () {

	local the_lang="en_US.UTF-8"

	util_error_echo
	util_error_echo update-locale LANG=${the_lang} LC_ALL=${the_lang}
	util_error_echo
	update-locale LANG=${the_lang} LC_ALL=${the_lang}


	return 0
}

sys_validate_lang () {

	local the_locale_gen_file="${THE_LOCALE_GEN_FILE_PATH}"

	local the_lang="${1}"

	if grep -i ${the_lang} ${the_locale_gen_file} 2>&1 >/dev/null; then
		return 0
	else
		return 1
	fi

}

sys_locale_gen_allowed_list_raw () {

	sys_tmp_dir_create

	local tmp_dir_path="${REF_MASTER_TMP_DIR_PATH}"
	local tmp_locale_gen_file_path="${tmp_dir_path}/locale-gen-raw.txt"



	local the_locale_gen=${@}

	local the_item=""

	echo -n | tee ${tmp_locale_gen_file_path} 2>&1 >/dev/null

	for the_item in ${the_locale_gen}; do
		if sys_validate_lang ${the_item}; then
			echo ${the_item} | tee -a ${tmp_locale_gen_file_path} 2>&1 >/dev/null
		fi
	done

	## please don't sort
	##cat ${tmp_locale_gen_file_path} | sort -u | tee ${tmp_locale_gen_file_path} 2>&1 >/dev/null

	cat ${tmp_locale_gen_file_path}

	return 0
}

sys_locale_gen_allowed_list_sort () {

	sys_tmp_dir_create

	local tmp_dir_path="${REF_MASTER_TMP_DIR_PATH}"
	local tmp_locale_gen_file_path="${tmp_dir_path}/locale-gen-sort.txt"



	local the_locale_gen=${@}

	local the_item=""

	echo -n | tee ${tmp_locale_gen_file_path} 2>&1 >/dev/null

	for the_item in ${the_locale_gen}; do
		if sys_validate_lang ${the_item}; then
			echo ${the_item} | tee -a ${tmp_locale_gen_file_path} 2>&1 >/dev/null
		fi
	done

	cat ${tmp_locale_gen_file_path} | sort -u | tee ${tmp_locale_gen_file_path} 2>&1 >/dev/null

	cat ${tmp_locale_gen_file_path}

	return 0
}

sys_locale_config_validate_args () {

	local the_lang="${REF_BUILD_LOCALE_NAME}"
	local the_locale_gen="${REF_BUILD_LOCALE_GEN}"
	local the_timezone="${REF_BUILD_TIMEZONE}"



	the_locale_gen="${the_lang} ${the_locale_gen}"
	the_locale_gen="$(sys_locale_gen_allowed_list_raw ${the_locale_gen})"


	local the_item=""
	local the_num=0

	for the_item in ${the_locale_gen}; do

		if [[ $the_num == 0 ]]; then
			the_lang=${the_item}
			break
		fi

		the_num=$((the_num+1))
	done

	if [ -z "${the_lang}" ]; then
		the_lang="en_US.UTF-8"
	fi

	the_locale_gen="en_US.UTF-8 ${the_locale_gen}"
	the_locale_gen="$(sys_locale_gen_allowed_list_sort ${the_locale_gen})"




	##
	## real load
	##

	REF_BUILD_LOCALE_NAME=${the_lang}
	REF_BUILD_LOCALE_GEN=${the_locale_gen}
	REF_BUILD_TIMEZONE=${the_timezone}

	#echo ${REF_BUILD_LOCALE_NAME}
	#echo ${REF_BUILD_LOCALE_GEN}
	#echo ${REF_BUILD_TIMEZONE}

}

mod_module_locale_config_init () {

	sys_locale_config_via_file

}


mod_module_locale_config_from_args () {

	sys_locale_config_validate_args

	sys_locale_config_from_args

}

mod_module_locale_config () {

	##
	## init
	##

	mod_module_locale_config_init




	##
	## config from args
	##
	mod_module_locale_config_from_args




	##
	## locale gen
	##

	sys_locale_gen




	return 0
}

##
### Tail: Model / mod_module_locale_config
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




	mod_module_locale_config




	return 0
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
