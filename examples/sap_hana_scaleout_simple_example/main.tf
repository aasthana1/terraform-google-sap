/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

provider "google" {
  version = "~> 2.6.0"
  region  = "${var.region}"
}

module "gcp_sap_hana_scaleout" {
  source                     = "../../modules/sap_hana_scaleout"
  post_deployment_script     = "${var.post_deployment_script}"
  subnetwork                 = "${var.subnetwork}"
  linux_image_family         = "${var.linux_image_family}"
  linux_image_project        = "${var.linux_image_project}"
  instance_type              = "${var.instance_type}"
  network_tags               = "${var.network_tags}"
  project_id                 = "${var.project_id}"
  region                     = "${var.region}"
  service_account_email      = "${var.service_account_email}"
  boot_disk_size             = "${var.boot_disk_size}"
  boot_disk_type             = "${var.boot_disk_type}"
  autodelete_disk            = "${var.autodelete_disk}"
  pd_ssd_size                = "${var.pd_ssd_size}"
  disk_type                  = "${var.disk_type}"
  sap_deployment_debug       = "false"
  post_deployment_script     = "${var.post_deployment_script}"
  sap_hana_deployment_bucket = "${var.sap_hana_deployment_bucket}"
  sap_deployment_debug       = "true"
  post_deployment_script     = "${var.post_deployment_script}"
  sap_hana_sid               = "D10"
  sap_hana_instance_number   = 10
  sap_hana_sidadm_password   = "${var.sap_hana_sidadm_password}"
  sap_hana_system_password   = "${var.sap_hana_system_password}"
  sap_hana_sidadm_uid        = 900
  sap_hana_sapsys_gid        = 900
  sap_hana_scaleout_nodes    = "${var.sap_hana_scaleout_nodes}"
  zone                       = "${var.zone}"
  instance_count_master      = "${var.instance_count_master}"
  instance_count_worker      = "${var.instance_count_worker}"
  instance_name              = "${var.instance_name}"
  device_name_boot           = "${var.device_name_boot}"
  device_name_pd_ssd         = "${var.device_name_pd_ssd}"
  startup_script_1           = "${var.startup_script_1}"
  startup_script_2           = "${var.startup_script_2}"
}
