resource "vsphere_virtual_machine" "domain_controller" {
    name             = "prd.windows_2022dc.domain_controller"
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    num_cpus         = 4
    memory           = 8096
    guest_id         = "windows9Server64Guest"
    firmware         = "bios"
    enable_logging   = false
    sync_time_with_host = true

    network_interface {
        network_id         = data.vsphere_network.vm_servers_trusted.id
        adapter_type       = "vmxnet3"
        mac_address        = "00:50:56:bc:4a:e6"
        use_static_mac     = false
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

    cpu_hot_add_enabled      = false
    cpu_hot_remove_enabled   = false
    memory_hot_add_enabled   = false
    enable_disk_uuid         = false
    nested_hv_enabled        = false
    efi_secure_boot_enabled  = false
    scsi_controller_count    = 1
    scsi_type                = "pvscsi"
    ide_controller_count     = 2
    num_cores_per_socket     = 1
    hardware_version         = 21
    poweron_timeout          = 300
    shutdown_wait_timeout    = 3
    migrate_wait_timeout     = 30
    wait_for_guest_net_timeout = 5
    wait_for_guest_net_routable = true
    run_tools_scripts_after_power_on = true
    run_tools_scripts_after_resume = true
    run_tools_scripts_before_guest_shutdown = true
    run_tools_scripts_before_guest_standby = true
    tools_upgrade_policy     = "manual"
}

resource "vsphere_virtual_machine" "rhel9_gitlab" {
    name             = "prd.rhel9.gitlab"
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    num_cpus         = 4
    memory           = 16384
    guest_id         = "rhel9_64Guest"
    scsi_type        = "lsilogic"

    network_interface {
        network_id   = data.vsphere_network.vm_servers_trusted.id
    }

    disk {
        label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
        size             = 500
        thin_provisioned = true
        datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    }
    
    clone {
        template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
        customize {
            linux_options {
                host_name = "gitlab"
                domain    = "campbell.lu"
            }
            network_interface {}
        }
    }
}

resource "vsphere_virtual_machine" "vcenter_server" {
    name             = "prd.photon.vcenter_server"
    resource_pool_id = "resgroup-11003"
    datastore_id     = "datastore-11006"
    num_cpus         = 4
    memory           = 32768
    guest_id         = "other3xLinux64Guest"
    firmware         = "bios"
    enable_logging   = true
    sync_time_with_host = true
    sync_time_with_host_periodically = true

    network_interface {
        network_id         = "network-11014"
        adapter_type       = "vmxnet3"
        mac_address        = "00:0c:29:d0:da:2a"
        use_static_mac     = false
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

    cpu_hot_add_enabled      = true
    cpu_hot_remove_enabled   = true
    memory_hot_add_enabled   = true
    enable_disk_uuid         = false
    nested_hv_enabled        = false
    efi_secure_boot_enabled  = false
    scsi_controller_count    = 3
    scsi_type                = "lsilogic"
    num_cores_per_socket     = 1
    hardware_version         = 10
    annotation               = "VMware vCenter Server Appliance"
    poweron_timeout          = 300
    shutdown_wait_timeout    = 3
    migrate_wait_timeout     = 30
    wait_for_guest_net_timeout = 5
    wait_for_guest_net_routable = true
    run_tools_scripts_after_power_on = true
    run_tools_scripts_after_resume = true
    run_tools_scripts_before_guest_shutdown = true
    run_tools_scripts_before_guest_standby = true
    tools_upgrade_policy     = "manual"
}

resource "vsphere_virtual_machine" "veeam_server" {
    name             = "prd.windows_2022std.veeam"
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
    num_cpus         = 8
    memory           = 16384
    guest_id         = "windows2019srvNext_64Guest"
    firmware         = "efi"
    enable_logging   = true
    sync_time_with_host = true

    network_interface {
        network_id         = data.vsphere_network.vm_servers_trusted.id
        adapter_type       = "vmxnet3"
        mac_address        = "00:50:56:bc:6c:8a"
        use_static_mac     = false
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
        client_device  = true
    }

    cpu_hot_add_enabled      = false
    cpu_hot_remove_enabled   = false
    memory_hot_add_enabled   = false
    enable_disk_uuid         = true
    nested_hv_enabled        = false
    efi_secure_boot_enabled  = true
    scsi_controller_count    = 1
    scsi_type                = "pvscsi"
    sata_controller_count    = 1
    num_cores_per_socket     = 8
    hardware_version         = 21
    poweron_timeout          = 300
    shutdown_wait_timeout    = 3
    migrate_wait_timeout     = 30
    wait_for_guest_net_timeout = 5
    wait_for_guest_net_routable = true
    run_tools_scripts_after_power_on = true
    run_tools_scripts_after_resume = true
    run_tools_scripts_before_guest_shutdown = true
    run_tools_scripts_before_guest_standby = true
    tools_upgrade_policy     = "manual"
}
