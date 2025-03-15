#!/bin/bash

# The warewulf node PXE bootneeds secure boot off

virsh destroy ww1-node0
virsh undefine ww1-node0 --nvram
# virsh undefine ww1-node1 --nvram --remove-all-storage

virt-install --osinfo almalinux9 --name ww1-node0 \
--boot uefi,network,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus sockets=1,cores=8,threads=1 \
--memory 8192 \
--network=network=ww1-nodes,mac=52:54:00:50:27:e0 \
--nodisks \
--noautoconsole --noreboot

virsh destroy ww1-node1
virsh undefine ww1-node1 --nvram

virt-install --osinfo almalinux9 --name ww1-node1 \
--boot uefi,network,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus sockets=1,cores=8,threads=1 \
--memory 8192 \
--network=network=ww1-nodes,mac=52:54:00:50:27:e1 \
--nodisks \
--noautoconsole --noreboot

virsh destroy ww1-node2
virsh undefine ww1-node2 --nvram

virt-install --osinfo almalinux9 --name ww1-node2 \
--boot uefi,network,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus sockets=1,cores=8,threads=1 \
--memory 8192 \
--network=network=ww1-nodes,mac=52:54:00:50:27:e2 \
--nodisks \
--noautoconsole --noreboot

virsh destroy ww1-node3
virsh undefine ww1-node3 --nvram

virt-install --osinfo almalinux9 --name ww1-node3 \
--boot uefi,network,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus sockets=1,cores=8,threads=1 \
--memory 8192 \
--network=network=ww1-nodes,mac=52:54:00:50:27:e3 \
--nodisks \
--noautoconsole --noreboot

virsh destroy ww1-node4
virsh undefine ww1-node4 --nvram

virt-install --osinfo almalinux9 --name ww1-node4 \
--boot uefi,network,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
--vcpus sockets=1,cores=8,threads=1 \
--memory 8192 \
--network=network=ww1-nodes,mac=52:54:00:50:27:e4 \
--nodisks \
--noautoconsole --noreboot

