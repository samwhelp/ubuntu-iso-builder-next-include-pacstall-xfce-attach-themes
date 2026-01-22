

################################################################################
### Head: Master / Sys / Chroot
##

sys_chroot_run () {

	local chroot_dir_path="${REF_DISTRO_IMG_DIR_PATH}"

	util_error_echo
	util_error_echo env DEBIAN_FRONTEND=noninteractive chroot "${chroot_dir_path}" ${@}
	util_error_echo
	env DEBIAN_FRONTEND=noninteractive chroot "${chroot_dir_path}" ${@}

}

sys_chroot () {

	local chroot_dir_path="${REF_DISTRO_IMG_DIR_PATH}"

	util_error_echo
	util_error_echo env DEBIAN_FRONTEND=noninteractive chroot "${chroot_dir_path}"
	util_error_echo
	env DEBIAN_FRONTEND=noninteractive chroot "${chroot_dir_path}"

}

##
### Tail: Master / Sys / Chroot
################################################################################


################################################################################
### Head: Master / Sys / Chroot / Mount
##

sys_distro_mount_for_chroot () {

	local chroot_dir_path="${REF_DISTRO_IMG_DIR_PATH}"

	if ! [ -d "${chroot_dir_path}" ]; then

		util_error_echo
		util_error_echo "##"
		util_error_echo "## ## Dir Not Exists"
		util_error_echo "##"
		util_error_echo
		util_error_echo "[Dir for chroot Not Exists]: ${chroot_dir_path}"
		util_error_echo

		return 0
	fi


	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L46-L52
	##

	##
	## mount --bind /dev "${chroot_dir_path}"/dev || true
	## mount --bind /run "${chroot_dir_path}"/run || true
	##
	## chroot "${chroot_dir_path}" mount none -t proc /proc || true
	## chroot "${chroot_dir_path}" mount none -t sysfs /sys || true
	## chroot "${chroot_dir_path}" mount none -t devpts /dev/pts || true
	##


	util_error_echo
	util_error_echo mount --bind /dev "${chroot_dir_path}"/dev
	util_error_echo
	mount --bind /dev "${chroot_dir_path}"/dev || true


	util_error_echo
	util_error_echo mount --bind /run "${chroot_dir_path}"/run
	util_error_echo
	mount --bind /run "${chroot_dir_path}"/run || true




	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" mount none -t proc /proc
	util_error_echo
	chroot "${chroot_dir_path}" mount none -t proc /proc || true


	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" mount none -t sysfs /sys
	util_error_echo
	chroot "${chroot_dir_path}" mount none -t sysfs /sys || true


	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" mount none -t devpts /dev/pts
	util_error_echo
	chroot "${chroot_dir_path}" mount none -t devpts /dev/pts || true


	return 0
}

sys_distro_unmount_for_chroot () {

	local chroot_dir_path="${REF_DISTRO_IMG_DIR_PATH}"

	if ! [ -d "${chroot_dir_path}" ]; then

		util_error_echo
		util_error_echo "##"
		util_error_echo "## ## Dir Not Exists"
		util_error_echo "##"
		util_error_echo
		util_error_echo "[Dir for chroot Not Exists]: ${chroot_dir_path}"
		util_error_echo

		return 0
	fi


	##
	## https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/scripts/build.sh#L54-L60
	##

	##
	## chroot "${chroot_dir_path}" umount /proc || true
	## chroot "${chroot_dir_path}" umount /sys || true
	## chroot "${chroot_dir_path}" umount /dev/pts || true
	##
	## umount "${chroot_dir_path}"/dev || true
	## umount "${chroot_dir_path}"/run || true
	##


	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" umount /proc
	util_error_echo
	chroot "${chroot_dir_path}" umount /proc || true


	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" umount /sys
	util_error_echo
	chroot "${chroot_dir_path}" umount /sys || true


	util_error_echo
	util_error_echo chroot "${chroot_dir_path}" umount /dev/pts
	util_error_echo
	chroot "${chroot_dir_path}" umount /dev/pts || true




	util_error_echo
	util_error_echo umount "${chroot_dir_path}"/dev
	util_error_echo
	umount "${chroot_dir_path}"/dev || true


	util_error_echo
	util_error_echo umount "${chroot_dir_path}"/run
	util_error_echo
	umount "${chroot_dir_path}"/run || true


	return 0
}

##
### Tail: Master / Sys / Chroot / Mount
################################################################################


################################################################################
### Head: Master / Sys / Chroot / Session
##

sys_chroot_session_prepare_dir () {


	util_error_echo
	util_error_echo rm -rf "${REF_CHROOT_SESSION_DIR_PATH}"
	util_error_echo
	rm -rf "${REF_CHROOT_SESSION_DIR_PATH}"


	util_error_echo
	util_error_echo mkdir -p "${REF_CHROOT_SESSION_DIR_PATH}"
	util_error_echo
	mkdir -p "${REF_CHROOT_SESSION_DIR_PATH}"


	return 0
}

sys_chroot_session_prepare_file () {


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_ASSET_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_ASSET_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_ASSET_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_ASSET_DIR_NAME}"


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_FACTORY_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_FACTORY_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_FACTORY_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_FACTORY_DIR_NAME}"


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_BASIC_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_BASIC_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_BASIC_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_BASIC_DIR_NAME}"


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_INSTALLER_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_INSTALLER_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_INSTALLER_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_INSTALLER_DIR_NAME}"


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_CYCLE_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_CYCLE_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_CYCLE_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_CYCLE_DIR_NAME}"


	util_error_echo
	util_error_echo cp -rfT "${REF_MASTER_OPTION_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_OPTION_DIR_NAME}"
	util_error_echo
	cp -rfT "${REF_MASTER_OPTION_DIR_PATH}" "${REF_CHROOT_SESSION_DIR_PATH}/${REF_MASTER_OPTION_DIR_NAME}"


	return 0
}

sys_chroot_session_process () {

	local script_file_path="${REF_ATCHROOT_SESSION_START_FILE_PATH}"

	sys_chroot_run ${script_file_path}

	return 0
}

##
### Tail: Master / Sys / Chroot / Session
################################################################################
