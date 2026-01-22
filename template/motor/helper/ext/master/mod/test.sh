

################################################################################
### Head: Master / Mod / Test
##

mod_test () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## mod_test"
	util_error_echo "##"
	util_error_echo


	#sys_package_install_for_build_iso

	#sys_tmp_dir_create

	#sys_distro_base_system_create

	#mod_distro_mount_for_chroot

	#mod_distro_unmount_for_chroot

	#mod_chroot_session_create

	#mod_chroot_session_process


	#mod_test_chroot_session

	#mod_test_distro_img_archive

	#mod_test_distro_iso_archive

	#mod_test_distro_iso_build

	#mod_test_distro_iso_create_manifest

	#mod_test_distro_iso_create_filesystem_size

	#mod_test_distro_iso_create_disk_info

	#mod_test_distro_iso_create_disk_define

	#mod_test_mod_distro_iso_create_readme

	#mod_test_distro_iso_create_checksum

	#mod_distro_build_finish

}

mod_test_chroot_session () {

	mod_distro_mount_for_chroot

	mod_chroot_session_process

	mod_distro_unmount_for_chroot

}

mod_test_distro_img_archive () {

	mod_distro_img_archive

}


mod_test_distro_iso_archive () {

	mod_distro_iso_archive

}



mod_test_distro_iso_build () {

	mod_distro_iso_build

}




mod_test_distro_iso_create_manifest () {

	mod_distro_iso_create_manifest

}

mod_test_distro_iso_create_filesystem_size () {

	mod_distro_iso_create_filesystem_size

}

mod_test_distro_iso_create_disk_info () {

	mod_distro_iso_create_disk_info

}

mod_test_distro_iso_create_disk_define () {

	mod_distro_iso_create_disk_define

}



mod_test_mod_distro_iso_create_readme () {

	mod_distro_iso_create_readme

}

mod_test_distro_iso_create_checksum () {

	mod_distro_iso_create_checksum

}

##
### Tail: Master / Mod / Test
################################################################################
