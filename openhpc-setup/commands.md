# xcp-ng and xoa

## Playbooks

```bash
# Utility
ansible -m setup localhost | sed "1s/.*/{/" > setup_vars.json
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook ping.yaml -l ww1-head1

# Install OpenHPC
ansible-playbook -v setup_hpc_head.yaml -l ww1-head1

```

## overlays

The OpenHPC warewulf puts overlay files in /srv/warewulf/overlays

Profile config is in /etc/warewulf/nodes.conf
wwinit, host, generic, and debug don't show up in profile list.

## slurm.conf update

```bash
scp -i /etc/warewulf/keys/ssh_host_ed25519_key /etc/slurm/slurm.conf n000.ww1:/etc/slurm/slurm.conf
wwctl exec n000.ww1 systemctl restart munge
wwctl ssh n000.ww1 systemctl restart slurmd

# Munge test from ww1-head
# Note: the runtime overlay update doesn't restart munged or slurmd
munge -n | ssh -i /etc/warewulf/keys/ssh_host_ed25519_key n000.ww1 unmunge
```

```bash
wwctl overlay create slurm
# wwctl overlay mkdir slurm /etc/slurm
# wwctl overlay import slurm /etc/slurm/slurm.conf
wwctl overlay mkdir slurm --mode 0700 /etc/munge
wwctl overlay import slurm /etc/munge/munge.key
# wwctl overlay import generic <(echo SLURMD_OPTIONS="--conf-server ${sms_ip}") /etc/sysconfig/slurmd
wwctl overlay mkdir slurm /etc/sysconfig
wwctl overlay import slurm <(echo SLURMD_OPTIONS="--conf-server 10.0.0.1") /etc/sysconfig/slurmd
wwctl overlay show slurm /etc/sysconfig/slurmd

# Directory needs to be empty for delete
wwctl overlay delete slurm /etc/slurm/slurm.conf
wwctl overlay delete slurm /etc/slurm

wwctl profile list --all default
wwctl overlay list --all slurm

wwctl profile set default --runtime generic,slurm
wwctl overlay build
```

```bash
# Clear inval or down status
scontrol update nodename=n00[0-4].ww1 state=idle
scontrol update nodename=n000.ww1 state=idle
scontrol update nodename=n001.ww1 state=idle
scontrol update nodename=n002.ww1 state=idle
scontrol update nodename=n003.ww1 state=idle
scontrol update nodename=n004.ww1 state=idle

# Shows node configuration
slurmd -C
```
