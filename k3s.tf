resource "vsphere_virtual_machine" "rhel9_k3s01" {
  name             = "prd.rhel9.k3s-01"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  scsi_type        = "lsilogic"

  network_interface {
    network_id = data.vsphere_network.vm_servers_trusted.id
  }

  disk {
    label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
    size             = 50
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
    customize {
      linux_options {
        host_name = "k3s-01"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s02" {
  name             = "prd.rhel9.k3s-02"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  scsi_type        = "lsilogic"

  network_interface {
    network_id = data.vsphere_network.vm_servers_trusted.id
  }

  disk {
    label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
    size             = 50
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
    customize {
      linux_options {
        host_name = "k3s-02"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}
resource "vsphere_virtual_machine" "rhel9_k3s03" {
  name             = "prd.rhel9.k3s-03"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  scsi_type        = "lsilogic"

  network_interface {
    network_id = data.vsphere_network.vm_servers_trusted.id
  }

  disk {
    label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
    size             = 50
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
    customize {
      linux_options {
        host_name = "k3s-03"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s04" {
  name             = "prd.rhel9.k3s-04"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  scsi_type        = "lsilogic"

  network_interface {
    network_id = data.vsphere_network.vm_servers_trusted.id
  }

  disk {
    label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
    size             = 50
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
    customize {
      linux_options {
        host_name = "k3s-04"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s05" {
  name             = "prd.rhel9.k3s-05"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = "rhel9_64Guest"
  scsi_type        = "lsilogic"

  network_interface {
    network_id = data.vsphere_network.vm_servers_trusted.id
  }

  disk {
    label            = data.vsphere_virtual_machine.rhel9_gold.disks.0.label
    size             = 50
    thin_provisioned = true
    datastore_id     = data.vsphere_datastore.mirrored_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.rhel9_gold.id
    customize {
      linux_options {
        host_name = "k3s-05"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}