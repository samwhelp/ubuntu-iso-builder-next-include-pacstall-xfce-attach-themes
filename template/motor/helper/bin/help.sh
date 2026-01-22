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
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Portal / portal_help
##

portal_help () {

cat << __EOF__

Usage:

	$ make [action]

Example:

	$ make
	$ make help

	$ make prepare

	$ make build
	$ make log-build

	$ make just-base-system
	$ make just-full-system

	$ make distro-mount
	$ make distro-unmount

	$ make chroot

	$ make step-renew-chroot-session-script
	$ make step-chroot-session-process

	$ make archive-system-to-squashfs
	$ make archive-system-to-iso

	$ make clean

Debug:
	$ export IS_DEBUG=true

__EOF__

}

##
### Tail: Portal / portal_help
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_help "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
