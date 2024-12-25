resource "vsphere_virtual_machine" "vcenter_server" {
  name                             = "prd.photon.vcenter_server"
  resource_pool_id                 = "resgroup-11003"
  datastore_id                     = "datastore-11006"
  num_cpus                         = 4
  memory                           = 32768
  guest_id                         = "other3xLinux64Guest"
  firmware                         = "bios"
  enable_logging                   = true
  sync_time_with_host              = true
  sync_time_with_host_periodically = true

  network_interface {
    network_id     = "network-11014"
    adapter_type   = "vmxnet3"
    mac_address    = "00:0c:29:d0:da:2a"
    use_static_mac = false
  }

  disk {
    label            = "Hard disk 1"
    size             = 49
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server.vmdk"
    unit_number      = 0
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 2"
    size             = 6
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_1.vmdk"
    unit_number      = 1
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 3"
    size             = 25
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_2.vmdk"
    unit_number      = 2
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 4"
    size             = 25
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_3.vmdk"
    unit_number      = 3
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 5"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_4.vmdk"
    unit_number      = 4
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 6"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_5.vmdk"
    unit_number      = 5
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 7"
    size             = 15
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_6.vmdk"
    unit_number      = 6
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 8"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_7.vmdk"
    unit_number      = 7
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 9"
    size             = 1
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_8.vmdk"
    unit_number      = 8
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 10"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_9.vmdk"
    unit_number      = 9
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 11"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_10.vmdk"
    unit_number      = 10
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 12"
    size             = 100
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_11.vmdk"
    unit_number      = 11
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 13"
    size             = 50
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_12.vmdk"
    unit_number      = 12
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 14"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_13.vmdk"
    unit_number      = 13
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 15"
    size             = 5
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_14.vmdk"
    unit_number      = 14
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 16"
    size             = 100
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_15.vmdk"
    unit_number      = 15
    controller_type  = "scsi"
  }

  disk {
    label            = "Hard disk 17"
    size             = 150
    eagerly_scrub    = false
    thin_provisioned = true
    datastore_id     = "datastore-11006"
    path             = "VMware vCenter Server/VMware vCenter Server_16.vmdk"
    unit_number      = 16
    controller_type  = "scsi"
  }

  cdrom {
  }

  cpu_hot_add_enabled                     = true
  cpu_hot_remove_enabled                  = true
  memory_hot_add_enabled                  = true
  enable_disk_uuid                        = false
  nested_hv_enabled                       = false
  efi_secure_boot_enabled                 = false
  scsi_controller_count                   = 3
  scsi_type                               = "lsilogic"
  num_cores_per_socket                    = 1
  hardware_version                        = 10
  annotation                              = "VMware vCenter Server Appliance"
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