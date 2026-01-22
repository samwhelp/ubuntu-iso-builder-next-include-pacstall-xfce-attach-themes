

chroot:
	sudo $(REF_MAIN_BIN_DIR_PATH)/chroot.sh
.PHONY: chroot


step-renew-chroot-session-script:
	sudo $(REF_MAIN_BIN_DIR_PATH)/step-renew-chroot-session-script.sh
.PHONY: step-renew-chroot-session-script


step-chroot-session-process:
	sudo $(REF_MAIN_BIN_DIR_PATH)/step-chroot-session-process.sh
.PHONY: step-chroot-session-process
