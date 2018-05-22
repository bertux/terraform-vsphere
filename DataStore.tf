data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
output "datastore_id" {
  value = "${data.vsphere_datastore.datastore.id}"
}
