variable "datacenter" {
  default = "home"
}
resource "vsphere_datacenter" "home" {
  name       = "${var.datacenter}"
}
data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

output "datacenter_id" {
  value = "${data.vsphere_datacenter.dc.id}"
}
