#!/bin/bash

virsh net-destroy ww1-nodes
virsh net-undefine ww1-nodes

virsh net-define ww1-nodes.xml
virsh net-autostart ww1-nodes
virsh net-start ww1-nodes
