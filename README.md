# controller-external-swift-proxy

- deploy.sh contains an example for how to deploy
- important files are: controller-swift-proxy-registry.yaml, controller-swift-proxy.sh, controller-swift-proxy.yaml
- please modify 
        SWIFT_PROXY_NAMES: "swift-node1 swift-node2 swift-node3"
        SWIFT_PROXY_IPS: "172.16.1.101 172.16.1.102 172.16.1.103"
  and all networks in network-environment.yaml as parameter_defaults, no need to modify any of the above templates directly

