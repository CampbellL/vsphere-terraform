resource "vsphere_virtual_machine" "rhel9_k3s_master01" {
  name             = "prd.rhel9.k3s-master-01"
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
        host_name = "k3s-master-01"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s_master02" {
  name             = "prd.rhel9.k3s-master-02"
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
        host_name = "k3s-master-02"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}
resource "vsphere_virtual_machine" "rhel9_k3s_master03" {
  name             = "prd.rhel9.k3s-master-03"
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
        host_name = "k3s-master-03"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s_worker01" {
  name             = "prd.rhel9.k3s-worker-01"
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
        host_name = "k3s-worker-01"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s_worker02" {
  name             = "prd.rhel9.k3s-worker-02"
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
        host_name = "k3s-worker-02"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_k3s_worker03" {
  name             = "prd.rhel9.k3s-worker-03"
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
        host_name = "k3s-worker-03"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}