This will: 
a) create 2 new networks
b) configure haproxy for external swift and disable existing swift config on controllers

****************************************************************************************************************************************************************************************************************
*** attention: this rewrites haproxy.cfg and restarts haproxy afterwards - this might interrupt service each time that a stack update is executed (addition of any nodes to the overcloud, any other changes ***
****************************************************************************************************************************************************************************************************************

This is an example, please adjust according to your settings ... in addition to your existing deploy command, it is important to include:
- -e /home/stack/templates/networks-additional/networks-additional-isolation.yaml
- -e /home/stack/templates/external-swift-proxy/controller-swift-proxy-registry.yaml

openstack overcloud deploy --templates -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml -e /home/stack/templates/networks-additional/networks-additional-isolation.yaml -e /home/stack/templates/network-environment.yaml -e /home/stack/templates/external-swift-proxy/controller-swift-proxy-registry.yaml --control-flavor control --compute-flavor compute --control-scale 3 --compute-scale 2 --ceph-storage-scale 0 --ntp-server 10.5.26.10 --neutron-network-type vxlan --neutron-tunnel-types vxlan


Also, I modified nic-configs/controller.yaml and nic-configs/compute.yaml in order to create 2 new networks

Please also check your network-environment.yaml. You will find the following new parameter_defaults in there. Please modify accordingly. No other changes should be needed:

  NetworkAdditional1NetCidr: '172.30.0.0/24'
  NetworkAdditional1NetworkVlanID: 910
  NetworkAdditional1AllocationPools: [{'start': '172.30.0.4', 'end': '172.30.0.250'}]
  NetworkAdditional2NetCidr: '172.31.0.0/24'
  NetworkAdditional2NetworkVlanID: 911
  NetworkAdditional2AllocationPools: [{'start': '172.31.0.4', 'end': '172.31.0.250'}]

  SWIFT_PROXY_NAMES: "swift-node1 swift-node2 swift-node3"
  SWIFT_PROXY_IPS: "172.19.0.101 172.19.0.102 172.19.0.103"
