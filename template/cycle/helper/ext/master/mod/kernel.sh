

################################################################################
### Head: Master / Mod / Kernel
##

mod_kernel_package_install () {

	local kernel_package="$(sys_kernel_package_name_find)"

	local extra_package="thermald"

	util_error_echo
	util_error_echo apt-get install -y ${kernel_package} ${extra_package}
	util_error_echo
	apt-get install -y ${kernel_package} ${extra_package}


	return 0
}


##
### Tail: Master / Mod / Kernel
################################################################################
