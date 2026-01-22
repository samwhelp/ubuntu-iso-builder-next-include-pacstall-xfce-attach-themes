#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
## * https://github.com/samwhelp/pacstall-packaging/tree/main/recipe/pacstall-packaging-deb/pacstall-packaging-deb
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
### Head: Model / mod_module_pacstall_install
##

sys_pacstall_install_repository_add_deb_coffee () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_maccity () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-maccity
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-maccity/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-maccity/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_wincity () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-wincity
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-wincity/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-wincity/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_fancy () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-fancy
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-fancy/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-fancy/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_gruvbox () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-gruvbox
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-gruvbox/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-gruvbox/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_grub () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-grub
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-grub/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-grub/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_sddm () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-sddm
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-sddm/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-sddm/main"


	return 0
}

sys_pacstall_install_repository_add () {

	sys_pacstall_install_repository_add_deb_coffee

	sys_pacstall_install_repository_add_deb_coffee_maccity

	sys_pacstall_install_repository_add_deb_coffee_wincity

	sys_pacstall_install_repository_add_deb_coffee_fancy

	sys_pacstall_install_repository_add_deb_coffee_gruvbox

	sys_pacstall_install_repository_add_deb_coffee_grub

	sys_pacstall_install_repository_add_deb_coffee_sddm

	return 0
}

sys_pacstall_install_packages () {


	##
	## ## Example
	##
	## `sudo pacstall -QPINs nushell-bin`
	##
	## `sudo pacstall -QPI nushell-bin`
	##


local run_cmd=$(cat << __EOF__
	pacstall -QPINs
		bean-appearance-citrus-icon-theme
		bean-appearance-vimix-gtk-theme
		bean-appearance-vimix-kde-theme

		bean-appearance-greystone-icon-theme

		bean-appearance-orchis-gtk-theme
		bean-appearance-graphite-gtk-theme
		bean-appearance-fluent-gtk-theme
		bean-appearance-colloid-gtk-theme
		bean-appearance-layan-gtk-theme
		bean-appearance-qogir-gtk-theme
		bean-appearance-lavanda-gtk-theme
		bean-appearance-jasper-gtk-theme

__EOF__
)




	util_error_echo
	util_error_echo $run_cmd
	util_error_echo

	$run_cmd




	return 0
}


mod_module_pacstall_install () {

	sys_pacstall_install_repository_add

	sys_pacstall_install_packages

	return 0
}

##
### Tail: Model / mod_module_pacstall_install
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


	mod_module_pacstall_install


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
