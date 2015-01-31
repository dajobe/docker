# config - sourced

# Prevent initramfs updates from trying to run grub and lilo.
export INITRD=no
export DEBIAN_FRONTEND=noninteractive

minimal_apt_get_args='-y --no-install-recommends'

# Debian release name
release=jessie
