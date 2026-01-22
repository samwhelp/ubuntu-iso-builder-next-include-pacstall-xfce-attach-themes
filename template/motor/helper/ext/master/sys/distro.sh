

################################################################################
### Head: Master / Sys / Distro
##




##
### Tail: Master / Sys / Distro
################################################################################


################################################################################
### Head: Master / Sys / Distro / Build Prepare
##

sys_package_install_for_build_iso () {

	util_error_echo
	util_error_echo sudo apt-get update
	util_error_echo
	sudo apt-get update




local run_cmd=$(cat << __EOF__
	sudo apt-get install -y --no-install-recommends
		binutils
		debootstrap
		squashfs-tools
		xorriso
		grub-pc-bin
		grub-efi-amd64
		grub2-common
		mtools
		dosfstools
__EOF__
)


	util_error_echo
	util_error_echo $run_cmd
	util_error_echo
	$run_cmd




	return 0
}

sys_package_install_for_build_iso_raw () {

	sudo apt-get update

	sudo apt-get install -y \
		binutils \
		debootstrap \
		squashfs-tools \
		xorriso \
		grub-pc-bin \
		grub-efi-amd64 \
		grub2-common \
		mtools \
		dosfstools \
		--no-install-recommends

	return 0
}


##
### Tail: Master / Sys / Distro / Build Prepare
################################################################################


################################################################################
### Head: Master / Sys / Distro / Build Finish
##

sys_distro_iso_move_to_dist_dir () {

	local now_str="$(date '+%Y%m%d-%H%M%S')"

	local lang_mode="${REF_BUILD_LOCALE_NAME_PART_MAIN}"
	lang_mode="${lang_mode,,}"



	local subject_name="${REF_BUILD_SUBJECT_NAME}"
	subject_name="${subject_name,,}"

	local source_iso_file_name="${subject_name}.iso"
	## Converts all characters in the variable to lowercase
	source_iso_file_name="${source_iso_file_name,,}"


	local source_iso_dir_path="${REF_DISTRO_OUT_DIR_PATH}"
	local source_iso_file_path="${source_iso_dir_path}/${source_iso_file_name}"



	local target_iso_file_main_name="${subject_name}.${lang_mode}.${now_str}"
	target_iso_file_main_name="${target_iso_file_main_name,,}"

	local target_iso_file_checksum_name="${target_iso_file_main_name}.sha256"
	local target_iso_file_name="${target_iso_file_main_name}.iso"
	## Converts all characters in the variable to lowercase
	target_iso_file_name="${target_iso_file_name,,}"

	local target_iso_dir_path="${REF_DISTRO_DIST_DIR_PATH}"
	local target_iso_file_path="${target_iso_dir_path}/${target_iso_file_name}"



	mkdir -p "${source_iso_dir_path}"
	mkdir -p "${target_iso_dir_path}"

	if ! [ -f ${source_iso_file_path} ]; then

		util_error_echo
		util_error_echo "##"
		util_error_echo "## ## [ISO Not Created]: ${source_iso_file_path}"
		util_error_echo "##"
		util_error_echo

		return 0
	fi




	##
	## ## Move ISO File to Dist Dir
	##

	util_error_echo
	util_error_echo mv "${source_iso_file_path}" "${target_iso_file_path}"
	util_error_echo
	mv "${source_iso_file_path}" "${target_iso_file_path}" || true





	##
	## ## Checksum
	##

	cd "${target_iso_dir_path}"

	sha256sum ${target_iso_file_name} | sudo tee "${target_iso_file_checksum_name}" 2>&1 >/dev/null || true


	cd "${OLDPWD}"



	##
	## ## Move Log File to Dist Dir
	##

	local source_log_file_path="${REF_MASTER_LOG_FILE_PATH}"
	local target_log_file_path="${target_iso_dir_path}/${target_iso_file_main_name}.log.txt"


	util_error_echo
	util_error_echo mv "${source_log_file_path}" "${target_log_file_path}"
	util_error_echo
	mv "${source_log_file_path}" "${target_log_file_path}"



	return 0
}

##
### Tail: Master / Sys / Distro / Build Finish
################################################################################


################################################################################
### Head: Master / Sys / Distro / File
##

sys_distro_file_clean () {

	rm -rf "${REF_DISTRO_IMG_DIR_PATH}"
	rm -rf "${REF_DISTRO_ISO_DIR_PATH}"
	rm -rf "${REF_DISTRO_OUT_DIR_PATH}"

	return 0
}

##
### Tail: Master / Sys / Distro / File
################################################################################


################################################################################
### Head: Master / Sys / Distro / Dir
##

sys_distro_dir_create () {

	mkdir -p "${REF_DISTRO_IMG_DIR_PATH}"
	mkdir -p "${REF_DISTRO_ISO_DIR_PATH}"
	mkdir -p "${REF_DISTRO_OUT_DIR_PATH}"

	return 0
}

##
### Tail: Master / Sys / Distro / Dir
################################################################################


################################################################################
### Head: Master / Sys / Distro / Base System
##

sys_distro_base_system_create () {

	sys_distro_dir_create




local run_cmd=$(cat << __EOF__
	debootstrap
		--arch=${REF_BUILD_ARCH}
		--variant=minbase
		--include=${REF_BUILD_PACKAGE_INCLUDE}
		${REF_BUILD_SUITE}
		${REF_DISTRO_IMG_DIR_PATH}
		${REF_BUILD_PACKAGE_REPO_URL}
__EOF__
)


	util_error_echo
	util_error_echo $run_cmd
	util_error_echo
	$run_cmd




	return 0
}

sys_distro_base_system_create_raw () {

	sys_distro_dir_create


	sudo debootstrap \
		--arch=${REF_BUILD_ARCH} \
		--variant=minbase \
		--include=${REF_BUILD_PACKAGE_INCLUDE} \
		${REF_BUILD_SUITE} \
		${REF_DISTRO_IMG_DIR_PATH} \
		${REF_BUILD_PACKAGE_REPO_URL}


	return 0
}

##
### Tail: Master / Sys / Distro / Base System
################################################################################


################################################################################
### Head: Master / Sys / Distro / Img
##

sys_distro_img_archive () {

	local squashfs_dir_path="${1}"
	local squashfs_file_path="${2}"

	sudo mksquashfs "${squashfs_dir_path}" "${squashfs_file_path}" \
		-noappend \
		-no-duplicates \
		-no-recovery \
		-wildcards \
		-b 1M \
		-comp zstd \
		-Xcompression-level 19 \
		-e "var/cache/apt/archives/*" \
		-e "tmp/*" \
		-e "tmp/.*" \
		-e "swapfile"


	return 0
}

sys_distro_img_archive_v1 () {

	local squashfs_dir_path="${1}"
	local squashfs_file_path="${2}"

	sudo mksquashfs "${squashfs_dir_path}" "${squashfs_file_path}" \
		-noappend \
		-no-duplicates \
		-no-recovery \
		-wildcards \
		-b 1M \
		-comp zstd \
		-Xcompression-level 19 \
		-e "var/cache/apt/archives/*" \
		-e "root/*" \
		-e "root/.*" \
		-e "tmp/*" \
		-e "tmp/.*" \
		-e "swapfile"


	return 0
}

sys_distro_img_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Img
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso
##

sys_distro_iso_archive () {

	local iso_dir_path="${1}"
	local iso_file_path="${2}"


	##
	## ## Notice: iso_volume_id (all characters must uppercase)
	##

	local iso_volume_id="${3}"
	iso_volume_id="${iso_volume_id^^}"


	util_error_echo
	util_error_echo cd "${iso_dir_path}"
	util_error_echo
	cd "${iso_dir_path}"
	util_error_echo


	sys_distro_iso_archive_pre



	sudo xorriso \
		-as mkisofs \
		-iso-level 3 \
		-full-iso9660-filenames \
		-volid "${iso_volume_id}" \
		-eltorito-boot boot/grub/bios.img \
			-no-emul-boot \
			-boot-load-size 4 \
			-boot-info-table \
			--eltorito-catalog boot/grub/boot.cat \
			--grub2-boot-info \
			--grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
		-eltorito-alt-boot \
			-e EFI/efiboot.img \
			-no-emul-boot \
			-append_partition 2 0xef isolinux/efiboot.img \
		-output "${iso_file_path}" \
		-m "isolinux/efiboot.img" \
		-m "isolinux/bios.img" \
		-graft-points \
			"/EFI/efiboot.img=isolinux/efiboot.img" \
			"/boot/grub/grub.cfg=isolinux/grub.cfg" \
			"/boot/grub/bios.img=isolinux/bios.img" \
			"."


	sys_distro_iso_archive_post


	util_error_echo
	util_error_echo cd "${OLDPWD}"
	util_error_echo
	cd "${OLDPWD}"
	util_error_echo


	return 0
}

sys_distro_iso_extract () {


	return 0
}

##
### Tail: Master / Sys / Distro / Iso
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Archive
##

sys_distro_iso_archive_pre () {

	return 0
}

sys_distro_iso_archive_post () {

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Archive
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Grub Config
##

sys_distro_iso_create_grub_cfg () {


	##
	## --output="isolinux/grub.cfg" \
	##

	local grub_cfg_file_path="${1}"
	local menu_entry_subject_name="${2}"


	##
	## ## Notice: iso_volume_id (all characters must uppercase)
	##

	local iso_volume_id="${3}"
	iso_volume_id="${iso_volume_id^^}"




cat << __EOF__ > "${grub_cfg_file_path}"

search --set=root --file /${iso_volume_id}

insmod all_video

set default="0"
set timeout=10

menuentry "${menu_entry_subject_name}" {
	set gfxpayload=keep
	linux   /casper/vmlinuz boot=casper nopersistent quiet splash ---
	initrd  /casper/initrd
}

menuentry "${menu_entry_subject_name} (Safe Graphics)" {
	set gfxpayload=keep
	linux   /casper/vmlinuz boot=casper nopersistent nomodeset ---
	initrd  /casper/initrd
}

if [ "\$grub_platform" == "efi" ]; then
	menuentry "Boot from next volume" {
		exit 1
	}

	menuentry "UEFI Firmware Settings" {
		fwsetup
	}
fi
__EOF__




	return 0
}


##
### Tail: Master / Sys / Distro / Iso / Create / Grub Config
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Boot Image
##

sys_distro_iso_create_boot_image_for_hybrid () {

	##
	## --output="isolinux/bios.img" \
	##

	local cdboot_img_file_path="/usr/lib/grub/i386-pc/cdboot.img"
	local core_img_file_path="${1}"
	local bios_img_file_path="${2}"


	cat "${cdboot_img_file_path}" "${core_img_file_path}" > "${bios_img_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_bios () {

	local boot_image_file_path="${1}"

	sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone "${boot_image_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_uefi () {

	local boot_image_file_path="${1}"

	#sys_distro_iso_create_boot_image_for_uefi_via_grub_install "${boot_image_file_path}"

	sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage "${boot_image_file_path}"

	return 0
}

sys_distro_iso_create_boot_image_for_bios_via_grub_mkstandalone () {

	local boot_image_file_path="${1}"


	##
	## --output="isolinux/core.img" \
	##

	grub-mkstandalone \
		--format=i386-pc \
		--output="${boot_image_file_path}" \
		--install-modules="linux16 linux normal iso9660 biosdisk memdisk search tar ls" \
		--modules="linux16 linux normal iso9660 biosdisk search" \
		--locales="" \
		--fonts="" \
		"boot/grub/grub.cfg=isolinux/grub.cfg"


	return 0
}

sys_distro_iso_create_boot_image_for_uefi_via_grub_mkimage () {

	local boot_image_file_path="${1}"


	##
	## --output="isolinux/efiboot.img" \
	##


	##
	## ## MODULES dir from Package: grub-efi-amd64-bin
	## ls -1 /usr/lib/grub/x86_64-efi/
	##


	sudo grub-mkimage \
		--format="x86_64-efi" \
		--output="${boot_image_file_path}" \
		--directory="/usr/lib/grub/x86_64-efi" \
		--prefix="/EFI" \
			fat \
			iso9660 \
			part_gpt \
			part_msdos \
			normal \
			boot \
			linux \
			linux16 \
			configfile \
			loopback \
			chain \
			efifwsetup \
			efi_gop \
			efi_uga \
			ls \
			search \
			search_label \
			search_fs_uuid \
			search_fs_file \
			gfxterm \
			gfxterm_background \
			gfxmenu \
			test \
			all_video \
			loadenv \
			exfat \
			ext2 \
			ntfs \
			btrfs \
			hfsplus \
			udf \
			cat


	return 0
}

sys_distro_iso_create_boot_image_for_uefi_via_grub_install () {

	return 0
}


##
### Tail: Master / Sys / Distro / Iso / Create / Boot Image
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Kernel
##

sys_distro_iso_create_kernel_via_copy () {

	local source_dir_path="${1}"
	local target_dir_path="${2}"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	rm -f "${target_dir_path}"/vmlinuz
	rm -f "${target_dir_path}"/initrd

	cp -f "${source_dir_path}"/vmlinuz-**-**-generic "${target_dir_path}"/vmlinuz
	cp -f "${source_dir_path}"/initrd.img-**-**-generic "${target_dir_path}"/initrd

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Kernel
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Manifest
##

sys_distro_iso_create_manifest () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}/casper"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	sudo chroot "${source_dir_path}" dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee "${target_dir_path}/filesystem.manifest" 2>&1 >/dev/null

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Manifest
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Filesystem Size
##

sys_distro_iso_create_filesystem_size () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}/casper"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	printf $(du -sx --block-size=1 "${source_dir_path}" | cut -f1) > "${target_dir_path}/filesystem.size"

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Filesystem Size
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Disk Info
##

sys_distro_iso_create_disk_info () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}/.disk"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	local date_str="$(date '+%Y-%m-%d')"

	echo "${REF_BUILD_SUBJECT_TITLE} ${REF_BUILD_VERSION} ${REF_BUILD_SUITE} - Release ${REF_BUILD_ARCH} (${date_str})" | sudo tee "${target_dir_path}"/info 2>&1 >/dev/null

	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Disk Info
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Disk Define
##

sys_distro_iso_create_disk_define () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"


cat << __EOF__ > "${target_dir_path}/README.diskdefines"
#define DISKNAME  Try ${REF_BUILD_SUBJECT_TITLE}
#define TYPE  binary
#define TYPEbinary  1
#define ARCH  amd64
#define ARCHamd64  1
#define DISKNUM  1
#define DISKNUM1  1
#define TOTALNUM  0
#define TOTALNUM0  1
__EOF__


	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Disk Define
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Readme
##

sys_distro_iso_create_readme () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"

	local date_str="$(date '+%Y-%m-%d')"

cat << __EOF__ > "${target_dir_path}/README.md"

# ${REF_BUILD_SUBJECT_TITLE}

> This is a custom Ubuntu-based Linux distribution.


## Build Info

| Key           | Value                 |
| ------------- | --------------------- |
| Language      | ${REF_BUILD_LOCALE_NAME}           |
| Version       | ${REF_BUILD_VERSION}                 |
| Date          | ${date_str}            |

__EOF__


	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Readme
################################################################################


################################################################################
### Head: Master / Sys / Distro / Iso / Create / Checksum
##

sys_distro_iso_create_checksum_md5sum () {

	local distro_img_dir_path="${1}"
	local distro_iso_dir_path="${2}"

	local source_dir_path="${distro_img_dir_path}"
	local target_dir_path="${distro_iso_dir_path}"

	mkdir -p "${source_dir_path}"
	mkdir -p "${target_dir_path}"


	cd "${target_dir_path}"

	sudo /bin/bash -c "(find . -type f -print0 | xargs -0 md5sum | grep -v -e 'md5sum.txt' -e 'bios.img' -e 'efiboot.img' > md5sum.txt)"

	cd "${OLDPWD}"


	return 0
}

##
### Tail: Master / Sys / Distro / Iso / Create / Checksum
################################################################################
