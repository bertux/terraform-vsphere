variable "hosts" {
  default = [
    "192.168.0.14",
  ]
}

data "vsphere_host" "hosts" {
  count         = "${length(var.hosts)}"
  name          = "${var.hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "cluster"
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  host_system_ids = ["${data.vsphere_host.hosts.*.id}"]

  drs_enabled          = false
  ha_enabled = false
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "cluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

output "resource_pool_id" {
  value = "${data.vsphere_compute_cluster.compute_cluster.resource_pool_id}"
}
