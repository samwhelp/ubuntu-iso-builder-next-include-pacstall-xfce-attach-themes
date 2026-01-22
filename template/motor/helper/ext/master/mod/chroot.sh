

################################################################################
### Head: Master / Mod / Chroot
##

mod_chroot_run () {

	mod_distro_mount_for_chroot

	sys_chroot_run ${@}

	sleep 1

	mod_distro_unmount_for_chroot

	return 0
}

mod_chroot () {

	mod_distro_mount_for_chroot

	sys_chroot

	sleep 1

	mod_distro_unmount_for_chroot

	return 0

}




##
### Tail: Master / Mod / Chroot
################################################################################


################################################################################
### Head: Master / Mod / Chroot / Mount
##

mod_distro_mount_for_chroot () {

	sys_distro_unmount_for_chroot

	sys_distro_mount_for_chroot

	return 0
}

mod_distro_unmount_for_chroot () {

	sys_distro_unmount_for_chroot

	return 0
}

##
### Tail: Master / Mod / Chroot / Mount
################################################################################


################################################################################
### Head: Master / Mod / Chroot / Session
##


mod_chroot_session_create () {

	sys_chroot_session_prepare_dir

	sys_chroot_session_prepare_file

	return 0
}

mod_chroot_session_process () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_chroot_session_process"
	util_error_echo "##"
	util_error_echo


	mod_chroot_session_create

	sys_chroot_session_process


}

mod_step_renew_chroot_session_script () {


	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_step_renew_chroot_session_script"
	util_error_echo "##"
	util_error_echo


	mod_chroot_session_create


	return 0
}

mod_step_chroot_session_process () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_step_chroot_session_process"
	util_error_echo "##"
	util_error_echo


	mod_distro_mount_for_chroot

	sys_chroot_session_process

	sleep 1

	mod_distro_unmount_for_chroot


	return 0
}

##
### Tail: Master / Mod / Chroot / Session
################################################################################
