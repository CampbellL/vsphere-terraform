resource "vsphere_virtual_machine" "veeam_server" {
  name                = "prd.windows_2022std.veeam"
  resource_pool_id    = data.vsphere_resource_pool.pool.id
  datastore_id        = data.vsphere_datastore.mirrored_datastore.id
  num_cpus            = 8
  memory              = 16384
  guest_id            = "windows2019srvNext_64Guest"
  firmware            = "efi"
  enable_logging      = true
  sync_time_with_host = true

  network_interface {
    network_id     = data.vsphere_network.vm_servers_trusted.id
    adapter_type   = "vmxnet3"
    mac_address    = "00:50:56:bc:6c:8a"
    use_static_mac = false
  }

  disk {
    label            = "Hard disk 1"
    size             = 90
    eagerly_scrub    = false
    thin_provisioned = false
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    path             = "prd.windows_2022std.veeam/prd.windows_2022std.veeam-000001.vmdk"
    unit_number      = 0
    controller_type  = "scsi"
  }

  cdrom {
    client_device = true
  }

  cpu_hot_add_enabled                     = false
  cpu_hot_remove_enabled                  = false
  memory_hot_add_enabled                  = false
  enable_disk_uuid                        = true
  nested_hv_enabled                       = false
  efi_secure_boot_enabled                 = true
  scsi_controller_count                   = 1
  scsi_type                               = "pvscsi"
  sata_controller_count                   = 1
  num_cores_per_socket                    = 8
  hardware_version                        = 21
  poweron_timeout                         = 300
  shutdown_wait_timeout                   = 3
  migrate_wait_timeout                    = 30
  wait_for_guest_net_timeout              = 5
  wait_for_guest_net_routable             = true
  run_tools_scripts_after_power_on        = true
  run_tools_scripts_after_resume          = true
  run_tools_scripts_before_guest_shutdown = true
  run_tools_scripts_before_guest_standby  = true
  tools_upgrade_policy                    = "manual"
}