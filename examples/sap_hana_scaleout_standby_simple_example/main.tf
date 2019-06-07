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

module "gcp_sap_hana_scaleout_standby" {
  source                     = "../../modules/sap_hana_scaleout_standby"
  post_deployment_script     = "${var.post_deployment_script}"
  subnetwork                 = "${var.subnetwork}"
  linux_image_family         = "${var.linux_image_family}"
  linux_image_project        = "${var.linux_image_project}"
  instance_type              = "${var.instance_type}"
  network_tags               = "${var.network_tags}"
  project_id                 = "${var.project_id}"
  region                     = "${var.region}"
  service_account            = "${var.service_account}"
  boot_disk_size             = "${var.boot_disk_size}"
  boot_disk_type             = "${var.boot_disk_type}"
  autodelete_disk            = "${var.autodelete_disk}"
  disk_type                  = "${var.disk_type}"
  pd_ssd_size                = "${var.pd_ssd_size}"
  min_cpu_platform           = "${var.min_cpu_platform}"
  sap_hana_deployment_bucket = "${var.sap_hana_deployment_bucket}"
  sap_deployment_debug       = "${var.sap_deployment_debug}"
  sap_hana_sid               = "${var.sap_hana_sid}"
  sap_hana_instance_number   = "${var.sap_hana_instance_number}"
  sap_hana_sidadm_password   = "${var.sap_hana_sidadm_password}"
  sap_hana_system_password   = "${var.sap_hana_system_password}"
  sap_hana_sidadm_uid        = "${var.sap_hana_sidadm_uid}"
  sap_hana_sapsys_gid        = "${var.sap_hana_sapsys_gid}"
  sap_hana_scaleout_nodes    = "${var.sap_hana_scaleout_nodes}"
  sap_hana_total_nodes       = "${var.sap_hana_total_nodes}"
  sap_hana_original_role     = "${var.sap_hana_original_role}"
  sap_hana_shared_nfs        = "${var.sap_hana_shared_nfs}"
  sap_hana_backup_nfs        = "${var.sap_hana_backup_nfs}"
  sap_hana_worker_nodes      = "${var.sap_hana_worker_nodes}"
  sap_hana_standby_nodes     = "${var.sap_hana_standby_nodes}"
  sap_hana_orgiginal_role    = "${var.sap_hana_orgiginal_role}"
  zone                       = "${var.zone}"
  instance_count_master      = "${var.instance_count_master}"
  instance_count_worker      = "${var.instance_count_worker}"
  instance_name              = "${var.instance_name}"
  device_name_boot           = "${var.device_name_boot}"
  device_name_pd_ssd         = "${var.device_name_pd_ssd}"
  startup_script_primary     = "${var.startup_script_primary}"
  startup_script_secondary   = "${var.startup_script_secondary}"
}
