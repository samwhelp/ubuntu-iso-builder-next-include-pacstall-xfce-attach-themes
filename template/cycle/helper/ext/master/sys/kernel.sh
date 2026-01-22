

################################################################################
### Head: Master / Sys / Kernel
##

sys_kernel_package_name_find () {

	#sys_kernel_package_name_find_for_specific

	sys_kernel_package_name_find_for_generic

	#sys_kernel_package_name_find_via_apt_cache

	#sys_kernel_package_name_find_via_apt

}

sys_kernel_package_name_find_for_specific () {

	##
	## apt-cache show linux-image-generic | grep '^Depends'
	##

	echo "linux-image-6.14.0-27-generic linux-modules-extra-6.14.0-27-generic linux-firmware intel-microcode amd64-microcode"

	return 0
}

sys_kernel_package_name_find_for_generic () {

	echo "linux-image-generic"

	return 0
}

sys_kernel_package_name_find_via_apt_cache () {

	apt-cache search linux-generic-hwe-* | awk -F ' - ' '/linux-generic-hwe-/ {print $1}' | sort | head -n 1

	return 0
}

sys_kernel_package_name_find_via_apt () {

	apt search linux-generic-hwe-* 2> /dev/null | awk -F'/' '/linux-generic-hwe-/ {print $1}' | sort | head -n 1

	return 0
}

##
### Tail: Master / Sys / Kernel
################################################################################
