#!/bin/bash

virsh destroy ww1-head1
virsh undefine ww1-head1 --nvram
# virsh undefine ww1-head1 --nvram --remove-all-storage

# --location does a direct boot of the vmlinuz and initrd from the iso
# --location "/data1/libvirt/d1isos/AlmaLinux-9.5-x86_64-dvd.iso" \
# --disk device=cdrom,path=/data1/libvirt/d1isos/AlmaLinux-9.5-x86_64-dvd.iso \
# --boot=uefi,loader=/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd \

# --initrd-inject "/data1/provision/kickstarts/ww1-head1-ks.cfg" \
# --extra-args="inst.ks=file:/ww1-head1-ks.cfg console=tty0 console=ttyS0,115200n8" \
# --extra-args="inst.ks=nfs:192.168.30.1:/data1/provision/kickstarts/ww1-head1-ks.cfg console=tty0 console=ttyS0,115200n8" \

# --extra-args="inst.ks=file:/ww1-head1-ks.cfg console=tty0 console=ttyS0,115200n8" \

virt-install --osinfo almalinux9 --name ww1-head1 \
--boot=uefi,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus 2 --memory 8192 \
--disk pool=d1disks,size=200 \
--network=bridge:br0 \
--network=network=ww1-nodes \
--location "/data1/libvirt/d1isos/AlmaLinux-9.6-x86_64-dvd.iso" \
--initrd-inject "/data1/provision/kickstarts/ww1-head1-ks.cfg" \
--extra-args="inst.ks=file:/ww1-head1-ks.cfg" \
--noautoconsole

