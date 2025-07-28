# openhpc

OpenHPC 3.3 with Warewulf 4.6.1 and Slurm 23.11.10 on Almalinux9
From the guide at <https://github.com/openhpc/ohpc/wiki/3.x>

<https://github.com/openhpc/ohpc/releases/download/v3.3.GA/Install_guide-almalinux9-Warewulf-SLURM-3.3-x86_64.pdf>


## warewulf

```bash
# Services
# Uses dhcpd with config at /etc/dhcp/dhcpd.conf

# wwctl / warewulfd runs http server for ipxe
# There's an image, system, and runtime img
http://10.0.0.1:9873/ipxe/52-54-00-50-27-e0&stage=image&compress=gz
http://10.0.0.1:9873/ipxe/52-54-00-50-27-e0&stage=system&compress=gz
http://10.0.0.1:9873/ipxe/52-54-00-50-27-e0&stage=runtime&compress=gz
```

```bash
# tftp directory
# /srv/tftpboot/warewulf

# Warewulf overlay directory
# /usr/share/warewulf/overlays

# Local overlay directory
# /srv/warewulf/overlays

# Local image directory
# /srv/warewulf/chroots

# Get image directory
wwctl image show alma-96
```

## Profile and overlay config

Image is a rootfs imported from a container.
The dracut rootfs image is built from a chroot directory in /srv/warewulf/chroots.

The profile is a nodes.conf yaml config that sets what overlay to use.

The overlays are directories in /usr/share/warewulf/overlays.
These appear to be more initrd images mounted at boot time.
