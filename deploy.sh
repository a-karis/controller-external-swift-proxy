#!/bin/bash

openstack overcloud deploy --templates -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml -e /home/stack/templates/networks-additional/networks-additional-isolation.yaml -e /home/stack/templates/network-environment.yaml -e /home/stack/templates/external-swift-proxy/controller-swift-proxy-registry.yaml --control-flavor control --compute-flavor compute --control-scale 1 --compute-scale 1 --ceph-storage-scale 0 --ntp-server 10.5.26.10 --neutron-network-type vxlan --neutron-tunnel-types vxlan
