resource "vsphere_virtual_machine" "enshrouded_server" {
  name                = "prd.windows_2025std.enshrouded"
  resource_pool_id    = data.vsphere_resource_pool.pool.id
  datastore_id        = data.vsphere_datastore.mirrored_datastore.id
  num_cpus            = 8
  memory              = 16384
  guest_id            = "windows2019srvNext_64Guest"
  firmware            = "efi"
  enable_logging      = true
  sync_time_with_host = true

  network_interface {
    network_id   = data.vsphere_network.vm_servers_trusted.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "Hard disk 1"
    size             = 90
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    controller_type  = "scsi"
  }

  cdrom {
    client_device = true
  }

  wait_for_guest_ip_timeout  = 0
  wait_for_guest_net_timeout = 0
}