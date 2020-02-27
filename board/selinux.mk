# SELinux
ifeq ($(SELINUX_PERMISSIVE),true)
BOARD_KERNEL_CMDLINE +=  androidboot.selinux=permissive
endif
#BOARD_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

 
