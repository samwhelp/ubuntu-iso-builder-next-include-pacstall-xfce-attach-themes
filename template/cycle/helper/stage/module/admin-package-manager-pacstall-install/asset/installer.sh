#!/usr/bin/env bash


#set -e




##
## # Install Pacstall
##
## * https://github.com/pacstall/pacstall-programs/blob/master/packages/pacstall/pacstall.pacscript
## * https://github.com/pacstall/pacstall/blob/master/install.sh
##




##
## ## Main / Init
##

REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
REF_CMD_FILE_NAME="$(basename "$0")"




##
## ## Main / Args
##

DEFAULT_SRCDIR="${REF_BASE_DIR_PATH}/prj"
SRCDIR="${SRCDIR:=$DEFAULT_SRCDIR}"


DEFAULT_DESTDIR="${REF_BASE_DIR_PATH}/pkg"
DESTDIR="${DESTDIR:=$DEFAULT_DESTDIR}"




##
## ## Kde Theme / Util
##

util_copy_from_srcdir_to_desdir () {

	local src_dir_path="${1}"
	local des_dir_path="${2}"


	echo
	echo mkdir -p "${src_dir_path}"
	mkdir -p "${src_dir_path}"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo cp -rfT "${src_dir_path}" "${des_dir_path}"
	cp -rfT "${src_dir_path}" "${des_dir_path}"


	echo

	return 0

}




##
## ## Kde Theme / Model
##

mod_project_install_bin () {

	local src_file_path="${prjdir}/pacstall"
	local des_file_path="${pkgdir}/usr/bin/pacstall"


	echo
	echo install -Dm755 "${src_file_path}" "${des_file_path}"
	install -Dm755 "${src_file_path}" "${des_file_path}"


	return 0
}

mod_project_install_scripts () {

	local src_dir_path="${prjdir}/misc/scripts"
	local des_dir_path="${pkgdir}/usr/share/pacstall/scripts"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mod_project_install_completions () {

	mod_project_install_completions_for_bash
	mod_project_install_completions_for_fish

	return 0
}

mod_project_install_completions_for_bash () {

	local src_file_path="${prjdir}/misc/completion/bash"
	local des_file_path="${pkgdir}/usr/share/bash-completion/completions/pacstall"


	echo
	echo install -Dm644 "${src_file_path}" "${des_file_path}"
	install -Dm644 "${src_file_path}" "${des_file_path}"


	return 0
}

mod_project_install_completions_for_fish () {

	local src_file_path="${prjdir}/misc/completion/fish"
	local des_file_path="${pkgdir}/usr/share/fish/vendor_completions.d/pacstall.fish"


	echo
	echo install -Dm644 "${src_file_path}" "${des_file_path}"
	install -Dm644 "${src_file_path}" "${des_file_path}"


	return 0
}

mod_project_install_man () {

	mod_project_install_man_to_compress
	mod_project_install_man_real

	return 0
}

mod_project_install_man_to_compress () {

	mod_project_install_man_to_compress_pacstall_5
	mod_project_install_man_to_compress_pacstall_8

	return 0
}

mod_project_install_man_to_compress_pacstall_5 () {

	local src_file_path="${prjdir}/misc/man/pacstall.5"

	echo
	echo gzip -9n "${src_file_path}"
	gzip -9n "${src_file_path}"


	return 0
}

mod_project_install_man_to_compress_pacstall_8 () {

	local src_file_path="${prjdir}/misc/man/pacstall.8"

	echo
	echo gzip -9n "${src_file_path}"
	gzip -9n "${src_file_path}"


	return 0
}

mod_project_install_man_real () {

	mod_project_install_man_real_pacstall_5
	mod_project_install_man_real_pacstall_8

	return 0
}

mod_project_install_man_real_pacstall_5 () {

	local src_file_path="${prjdir}/misc/man/pacstall.5.gz"
	local des_file_path="${pkgdir}/usr/share/man/man5/pacstall.5.gz"


	echo
	echo install -Dm644 "${src_file_path}" "${des_file_path}"
	install -Dm644 "${src_file_path}" "${des_file_path}"


	return 0
}

mod_project_install_man_real_pacstall_8 () {

	local src_file_path="${prjdir}/misc/man/pacstall.8.gz"
	local des_file_path="${pkgdir}/usr/share/man/man8/pacstall.8.gz"


	echo
	echo install -Dm644 "${src_file_path}" "${des_file_path}"
	install -Dm644 "${src_file_path}" "${des_file_path}"


	return 0
}

mod_project_install_repo () {

	local des_dir_path="${pkgdir}/usr/share/pacstall/repo"
	local des_file_path="${pkgdir}/usr/share/pacstall/repo/pacstallrepo"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo echo "https://raw.githubusercontent.com/pacstall/pacstall-programs/master" '|' tee "${des_file_path}"
	echo "https://raw.githubusercontent.com/pacstall/pacstall-programs/master" | tee "${des_file_path}" 2>&1 >/dev/null


	return 0
}

mod_project_install_message () {

	mod_project_install_message_prepare_dir
	mod_project_install_message_compile

	return 0
}

mod_project_install_message_prepare_dir () {

	local src_po_dir_path="${prjdir}/misc/po"


	mapfile -t linguas < "${src_po_dir_path}/LINGUAS"

	local lang=""

	for lang in "${linguas[@]}"; do
		echo
		echo mkdir -p "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/"
		mkdir -p "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/"
	done


	return 0
}

mod_project_install_message_compile () {

	local src_po_dir_path="${prjdir}/misc/po"


	mapfile -t linguas < "${src_po_dir_path}/LINGUAS"

	local lang=""

	for lang in "${linguas[@]}"; do
		echo
		echo msgfmt -o "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/pacstall.mo" "${src_po_dir_path}/${lang}.po"
		msgfmt -o "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/pacstall.mo" "${src_po_dir_path}/${lang}.po"
	done


	return 0
}

mod_project_install_dir () {

	mod_project_install_dir_for_log
	mod_project_install_dir_for_metadata
	mod_project_install_dir_for_cache
	mod_project_install_dir_for_src

	return 0
}

mod_project_install_dir_for_log () {

	local des_dir_path="${pkgdir}/var/log/pacstall/error_log"

	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"

	return 0
}

mod_project_install_dir_for_metadata () {

	local des_dir_path="${pkgdir}/var/lib/pacstall/metadata"

	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"

	return 0
}

mod_project_install_dir_for_cache () {

	local des_dir_path="${pkgdir}/var/cache/pacstall"

	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"

	return 0
}

mod_project_install_dir_for_src () {

	local des_dir_path="${pkgdir}/usr/src/pacstall"

	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"

	return 0
}




##
## ## Model / Start
##

model_start () {


	echo
	echo "P: pacstall install"

	echo
	echo "Shell: DESTDIR=${DESTDIR}"

	prjdir="${SRCDIR}"

	pkgdir="${DESTDIR}"


	echo
	echo mkdir -p "${prjdir}"
	mkdir -p "${prjdir}"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"




	mod_project_install_bin
	mod_project_install_scripts
	mod_project_install_completions

	mod_project_install_man
	mod_project_install_repo
	mod_project_install_message
	mod_project_install_dir




	echo

	return 0

}




##
## ## Main / Start
##

__main__ () {

	model_start "${@}"

}

__main__ "${@}"
