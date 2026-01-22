

################################################################################
### Head: Master / Mod / Distro
##

mod_distro_build_iso_from_scratch () {




	mod_distro_build_prepare




	mod_distro_base_system_create




	mod_distro_mount_for_chroot

	mod_chroot_session_process

	mod_distro_iso_build

	mod_distro_unmount_for_chroot




	mod_distro_build_finish




	return 0
}

mod_distro_base_system_from_scratch () {




	mod_distro_build_prepare




	mod_distro_base_system_create




	return 0
}

mod_distro_full_system_from_scratch () {




	mod_distro_build_prepare




	mod_distro_base_system_create




	mod_distro_mount_for_chroot

	mod_chroot_session_process

	mod_distro_unmount_for_chroot




	return 0
}

##
### Tail: Master / Mod / Distro
################################################################################


################################################################################
### Head: Master / Mod / Distro / Build Prepare
##

mod_distro_build_prepare () {

	sys_package_install_for_build_iso

	sys_tmp_dir_create

	sys_distro_dir_create

	sys_distro_file_clean

	return 0
}

##
### Tail: Master / Mod / Distro / Build Prepare
################################################################################


################################################################################
### Head: Master / Mod / Distro / Build Finish
##

mod_distro_build_finish () {

	sys_distro_iso_move_to_dist_dir

	return 0
}

##
### Tail: Master / Mod / Distro / Build Finish
################################################################################


################################################################################
### Head: Master / Mod / Distro / Build Clean
##

mod_distro_build_clean () {

	mod_distro_unmount_for_chroot

	sys_distro_file_clean

	return 0
}

##
### Tail: Master / Mod / Distro / Build Clean
################################################################################


################################################################################
### Head: Master / Mod / Distro / Base System
##

mod_distro_base_system_create () {

	mod_distro_unmount_for_chroot

	sys_distro_base_system_create

	return 0
}

##
### Tail: Master / Mod / Distro / Base System
################################################################################


################################################################################
### Head: Master / Mod / Distro / Img
##

mod_distro_img_archive () {

	local squashfs_root_dir_path="${REF_DISTRO_ISO_DIR_PATH}/casper"

	mkdir -p "${squashfs_root_dir_path}"

	local squashfs_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local squashfs_file_path="${squashfs_root_dir_path}/filesystem.squashfs"

	rm -f "${squashfs_file_path}"

	mod_distro_unmount_for_chroot

	sys_distro_img_archive "${squashfs_dir_path}" "${squashfs_file_path}"


	return 0
}

mod_distro_img_extract () {


	return 0
}

##
### Tail: Master / Mod / Distro / Img
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso
##

mod_distro_iso_archive_v1 () {

	local now_str="$(date '+%Y%m%d-%H%M%S')"

	local subject_name="${REF_BUILD_SUBJECT_NAME}"
	subject_name="${subject_name,,}"

	local iso_file_name="${subject_name}.${now_str}.iso"
	## Converts all characters in the variable to lowercase
	iso_file_name="${iso_file_name,,}"


	local iso_dir_path="${REF_DISTRO_ISO_DIR_PATH}"
	local iso_file_path="${REF_DISTRO_OUT_DIR_PATH}/${iso_file_name}"
	local iso_volume_id="${REF_BUILD_ISO_VOLUME_ID}"

	rm -f "${iso_file_path}"

	sys_distro_iso_archive "${iso_dir_path}" "${iso_file_path}" "${iso_volume_id}"

	return 0
}

mod_distro_iso_archive () {

	local subject_name="${REF_BUILD_SUBJECT_NAME}"
	subject_name="${subject_name,,}"

	local iso_file_name="${subject_name}.iso"
	## Converts all characters in the variable to lowercase
	iso_file_name="${iso_file_name,,}"


	local iso_dir_path="${REF_DISTRO_ISO_DIR_PATH}"
	local iso_file_path="${REF_DISTRO_OUT_DIR_PATH}/${iso_file_name}"
	local iso_volume_id="${REF_BUILD_ISO_VOLUME_ID}"

	rm -f "${iso_file_path}"

	sys_distro_iso_archive "${iso_dir_path}" "${iso_file_path}" "${iso_volume_id}"

	return 0
}

mod_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Mod / Distro / Iso
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Build
##

mod_distro_iso_build () {


	##
	## ## create dir
	##

	mod_distro_iso_create_base_dir


	##
	## ## copy kernel
	##

	mod_distro_iso_create_kernel


	##
	## ## create manifest
	##

	mod_distro_iso_create_manifest
	mod_distro_iso_create_filesystem_size
	mod_distro_iso_create_disk_info
	mod_distro_iso_create_disk_define
	mod_distro_iso_create_readme


	##
	## ## archive distro os files to squashfs
	##

	mod_distro_img_archive


	##
	## ## boot files
	##

	mod_distro_iso_create_grub_cfg

	mod_distro_iso_create_boot_image_for_bios

	mod_distro_iso_create_boot_image_for_hybrid

	mod_distro_iso_create_boot_image_for_uefi








	##
	## ## checksum
	##

	mod_distro_iso_create_checksum


	##
	## ## archive iso files finally
	##

	mod_distro_iso_archive


	return 0
}



##
### Tail: Master / Mod / Distro / Iso / Build
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Base Dir
##

mod_distro_iso_create_base_dir () {

	local distro_iso_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sudo rm -rf "${distro_iso_dir_path}"

	sudo mkdir -p "${distro_iso_dir_path}"/{casper,isolinux,.disk}

}

##
### Tail: Master / Mod / Distro / Iso / Create / Base Dir
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Grub Config
##

mod_distro_iso_create_grub_cfg () {

	local grub_cfg_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/grub.cfg"
	local menu_entry_subject_name="${REF_BUILD_SUBJECT_NAME}"
	local iso_volume_id="${REF_BUILD_ISO_VOLUME_ID}"

	sys_distro_iso_create_grub_cfg "${grub_cfg_file_path}" "${menu_entry_subject_name}" "${iso_volume_id}"

	return 0
}


##
### Tail: Master / Mod / Distro / Iso / Create / Grub Config
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Boot Image
##

mod_distro_iso_create_boot_image_for_hybrid () {

	local core_img_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/core.img"
	local bios_img_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/bios.img"

	sys_distro_iso_create_boot_image_for_hybrid "${core_img_file_path}" "${bios_img_file_path}"

	return 0
}

mod_distro_iso_create_boot_image_for_bios () {

	local boot_image_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/core.img"

	sys_distro_iso_create_boot_image_for_bios "${boot_image_file_path}"


	return 0
}


mod_distro_iso_create_boot_image_for_uefi () {

	local boot_image_file_path="${REF_DISTRO_ISO_DIR_PATH}/isolinux/efiboot.img"

	sys_distro_iso_create_boot_image_for_uefi "${boot_image_file_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Boot Image
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Kernel
##

mod_distro_iso_create_kernel () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}/boot"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}/casper"

	sys_distro_iso_create_kernel_via_copy "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Kernel
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Manifest
##

mod_distro_iso_create_manifest () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	mod_distro_mount_for_chroot

	sys_distro_iso_create_manifest "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Manifest
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Filesystem Size
##

mod_distro_iso_create_filesystem_size () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sys_distro_iso_create_filesystem_size "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Filesystem Size
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Disk Info
##

mod_distro_iso_create_disk_info () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sys_distro_iso_create_disk_info "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Disk Info
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Disk Define
##

mod_distro_iso_create_disk_define () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sys_distro_iso_create_disk_define "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Disk Define
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Readme
##

mod_distro_iso_create_readme () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sys_distro_iso_create_readme "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Readme
################################################################################


################################################################################
### Head: Master / Mod / Distro / Iso / Create / Checksum
##

mod_distro_iso_create_checksum () {

	local source_dir_path="${REF_DISTRO_IMG_DIR_PATH}"
	local target_dir_path="${REF_DISTRO_ISO_DIR_PATH}"

	sys_distro_iso_create_checksum_md5sum "${source_dir_path}" "${target_dir_path}"

	return 0
}

##
### Tail: Master / Mod / Distro / Iso / Create / Checksum
################################################################################
