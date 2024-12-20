data "vsphere_datacenter" "datacenter" {
    name = "dc-homelab"
}

data "vsphere_datastore" "host_datastore" {
    name          = "lancehead.physical.ssd.crucial.vmfs.esxi"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "fast_datastore" {
    name          = "lancehead.physical.ssd.crucial.vmfs.vms"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "mirrored_datastore" {
    name          = "lancehead.virtual.hdd.perc.vmfs.vms"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Resources"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_servers_untrusted" {
  name          = "VM Servers Untrusted"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_clients_trusted" {
  name          = "VM Clients Trusted"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_servers_trusted" {
  name          = "VM Servers Trusted"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_openshift" {
  name          = "VM Openshift"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_management" {
  name          = "VM Management"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}