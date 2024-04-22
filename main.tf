# Terraform

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "somestrongpass"
  auth_url    = "http://controller01:5000/v3"
  region      = "RegionOne"
}

# Create a RHEL server
resource "openstack_compute_instance_v2" "basic" {
  name            = "vm_from_terraform"
  image_id        = "567887bd-2635-4c2e-9feb-248a1b770745"
  flavor_id       = "i78478b4-2d58-42f6-940e-15bdea5a7849"

  metadata = {
    this = "that"
  }

  network {
    name = "Some_Network"
  }
}

# Cualquier cambio tiene que estar registrado