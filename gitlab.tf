resource "vsphere_virtual_machine" "rhel9_gitlab_gitlab_runner01" {
  name             = "prd.rhel9.gitlab-runner-01"
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
        host_name = "gitlabrunner01"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "rhel9_gitlab_gitlab_runner02" {
  name             = "prd.rhel9.gitlab-runner-02"
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
        host_name = "gitlabrunner02"
        domain    = "campbell.lu"
      }
      network_interface {}
    }
  }
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
    network_id = data.vsphere_network.vm_servers_trusted.id
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