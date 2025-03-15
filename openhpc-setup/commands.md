# xcp-ng and xoa

## Playbooks

```bash
# Utility
ansible -m setup localhost | sed "1s/.*/{/" > setup_vars.json
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook ping.yaml -l ww1-head1

# Install STIG/SCAP
ansible-playbook -v setup_hpc_head.yaml -l ww1-head1

```
