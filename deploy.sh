#!/bin/bash

openstack overcloud deploy --templates -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml -e /home/stack/templates/network-environment.yaml -e /home/stack/templates/controller-swift-proxy-registry.yaml --control-flavor control --compute-flavor compute --control-scale 3 --compute-scale 2 --ceph-storage-scale 0 --ntp-server 10.5.26.10 --neutron-network-type vxlan --neutron-tunnel-types vxlan
Deploying templates in the directory /usr/share/openstack-tripleo-heat-templates
