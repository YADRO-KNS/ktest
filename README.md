# ktest
Example to to run rdma-cluster with 3 VM

PHYSICAL_FUNCTIONS=(pci_0004_01_00_0 pci_0004_01_00_1)
PCI_CLIEN_COUNT=3
PCI_DEVICES_IN_NET=1

run-cluster-3 --rdma-network $PARAMS kernel
