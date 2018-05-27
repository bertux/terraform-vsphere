variable "datacenter" {
  default = "home"
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

output "datacenter_id" {
  value = "${data.vsphere_datacenter.dc.id}"
}
