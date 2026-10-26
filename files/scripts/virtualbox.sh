#!/usr/bin/env bash
set -euo pipefail

KVER="$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
install -Dm644 /tmp/akmods_privkey /etc/pki/akmods/private/private_key.priv


dnf -y install "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
dnf -y install "kernel-devel-${KVER}" "kernel-devel-matched-${KVER}" akmods

dnf -y install --setopt=tsflags=noscripts akmod-VirtualBox
dnf -y install VirtualBox

akmods --force --kernels "${KVER}" --kmod VirtualBox

MOD="$(ls /usr/lib/modules/"${KVER}"/extra/VirtualBox/vboxdrv.ko*)" || {
    find /var/cache/akmods/VirtualBox -name '*.log' -exec cat {} +
    exit 1
}
[[ -n "$(modinfo -F signer "${MOD}")" ]] || { echo "vboxdrv is not signed" >&2; exit 1; }

systemctl enable vboxdrv.service
rm -f /etc/pki/akmods/private/private_key.priv
dnf -y remove rpmfusion-free-release
