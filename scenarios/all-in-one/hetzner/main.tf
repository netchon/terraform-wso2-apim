
module "efstg_ssh" {
  source = "../../../modules/ssh"
  ssh_key_name = var.ssh_key_name
  ssh_key_pub = file("~/.ssh/id_ed25519.pub")
}

module "efstg_network_dmz" {
  source = "../../../modules/network"
  network_name = "${var.network_name}_dmz"
  network_cidr = var.network_cidr
  network_zone = var.network_zone
  subnet_cidr = var.subnet_cidr_dmz
  network_type = var.network_type
}

module "efstg_network_app" {
  source = "../../../modules/network"
  network_name = "${var.network_name}_app"
  network_cidr = var.network_cidr
  network_zone = var.network_zone
  subnet_cidr = var.subnet_cidr_app
  network_type = var.network_type
}

module "efstg_network_data" {
  source = "../../../modules/network"
  network_name = "${var.network_name}_data"
  network_cidr = var.network_cidr
  network_zone = var.network_zone
  subnet_cidr = var.subnet_cidr_data
  network_type = var.network_type
}


# BASTION SETUP
module "efstg_bastion" {
  source = "../../../modules/servers"
  count = var.enable_bastion ? 1 : 0
  server_name_prefix = "bastion"
  server_type = var.bastion_server_type
  image = var.image
  location = var.location
  network_id = module.efstg_network_dmz.network_id
  assign_public_ip = var.bastion_public_ip
  depends_on_resource = module.efstg_network_dmz
  ssh_key_ids = [ module.efstg_ssh.ssh_key_id ]
  server_label_role = "bastion"
}

module "efstg_fw_bastion" {
  source = "../../../modules/firewall"
  count = var.enable_bastion ? 1 : 0
  name = "efstg_fw_bastion"
  inbound_rules = var.bastion_inbound_rules
  outbound_rules = var.bastion_outbound_rules
  label_selector = "role=bastion"
}

# API MANAGER SETUP
module "efstg_apim" {
  source = "../../../modules/servers"
  count = var.server_count
  server_name_prefix = "apim"
  server_type = var.apim_server_type
  image = var.image
  location = var.location
  network_id = module.efstg_network_app.network_id
  depends_on_resource = module.efstg_network_app
  ssh_key_ids = [ module.efstg_ssh.ssh_key_id ]
  server_label_role = "apim"
}

module "efstg_fw_apim" {
  source = "../../../modules/firewall"
  count = var.server_count
  name = "efstg_fw_apim"
  inbound_rules = var.apim_inbound_rules
  outbound_rules = var.apim_outbound_rules
  label_selector = "role=apim"
}

# DATABASE SETUP
module "efstg_database" {
  source = "../../../modules/servers"
  count = var.server_count
  server_name_prefix = "db"
  server_type = var.db_server_type
  image = var.image
  location = var.location
  network_id = module.efstg_network_data.network_id
  depends_on_resource = module.efstg_network_data
  ssh_key_ids = [ module.efstg_ssh.ssh_key_id ]
  server_label_role = "db"
}

module "efstg_fw_database" {
  source = "../../../modules/firewall"
  count = var.server_count
  name = "efstg_fw_db"
  inbound_rules = var.db_inbound_rules
  label_selector = "role=db"
}

# LOAD BALANCER SETUP
module "efstg_lb" {
  source = "../../../modules/servers"
  count = var.server_count
  server_name_prefix = "lb"
  server_type = var.lb_server_type
  image = var.image
  location = var.location
  assign_public_ip = var.assign_public_ip
  network_id = module.efstg_network_dmz.network_id
  depends_on_resource = module.efstg_network_dmz
  ssh_key_ids = [ module.efstg_ssh.ssh_key_id ]
  server_label_role = "lb"
}

module "efstg_fw_lb" {
  source = "../../../modules/firewall"
  count = var.server_count
  name = "efstg_fw_lb"
  inbound_rules = var.lb_inbound_rules
  outbound_rules = var.lb_outbound_rules
  label_selector = "role=lb"
}
