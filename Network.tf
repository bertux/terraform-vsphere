data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
output "network_id" {
  value = "${data.vsphere_network.network.id}"
}
