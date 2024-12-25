resource "vsphere_virtual_machine" "domain_controller" {
  name                = "prd.windows_2022dc.domain_controller"
  resource_pool_id    = data.vsphere_resource_pool.pool.id
  datastore_id        = data.vsphere_datastore.mirrored_datastore.id
  num_cpus            = 4
  memory              = 8096
  guest_id            = "windows9Server64Guest"
  firmware            = "bios"
  enable_logging      = false
  sync_time_with_host = true

  network_interface {
    network_id     = data.vsphere_network.vm_servers_trusted.id
    adapter_type   = "vmxnet3"
    mac_address    = "00:50:56:bc:4a:e6"
    use_static_mac = false
  }

  disk {
    label            = "Hard disk 2"
    size             = 200
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    path             = "prd.windows_2022dc.domain_controller/prd.windows_2022dc.domain_controller-000001.vmdk"
    unit_number      = 0
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 1"
    size             = 90
    eagerly_scrub    = false
    thin_provisioned = false
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    path             = "prd.windows_2022dc.domain_controller/prd.windows_2022dc.domain_controller_1-000001.vmdk"
    unit_number      = 1
    controller_type  = "scsi"
  }

  cdrom {
    client_device = true
  }

  cpu_hot_add_enabled                     = false
  cpu_hot_remove_enabled                  = false
  memory_hot_add_enabled                  = false
  enable_disk_uuid                        = false
  nested_hv_enabled                       = false
  efi_secure_boot_enabled                 = false
  scsi_controller_count                   = 1
  scsi_type                               = "pvscsi"
  ide_controller_count                    = 2
  num_cores_per_socket                    = 1
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