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
  version = "~> 1.18.0"

  # TODO: Take out project if not needed
  project = "${var.project_id}"
  region  = "${var.region}"
}

module "gcp_sap_hana" {
  source                 = "../../modules/sap-hana"
  post_deployment_script = "${var.post_deployment_script}"
  subnetwork             = "${var.subnetwork}"
  linux_image_family     = "sles-12-sp3-sap"
  linux_image_project    = "suse-sap-cloud"
  instance_name          = "${var.instance_name}"
  instance_type          = "n1-highmem-16"
  zone                   = "us-central1-b"
  disk_type              = "pd-ssd"
  project_id             = "${var.project_id}"
  region                 = "${var.region}"
  service_account        = "${var.service_account}"
  boot_disk_type         = "pd-ssd"
  boot_disk_size         = 64
  autodelete_disk        = "true"
  pd_ssd_size            = 450
  compute_disk_1         = "sap-hana-disk-1"
  compute_disk_2         = "sap-hana-disk-2"
  compute_address        = "sap-hana-address-ip"

  #pd_standard_size = 50


  # sap_instance_name_prefix   = "${var.sap_instance_name_prefix}"

  #sap_hana_deployment_bucket = "${var.sap_hana_deployment_bucket}"
  sap_hana_deployment_bucket = "hana-gcp-20/hana20sps03"
  # TODO: Set as default
  sap_deployment_debug = "false"

  #Erase line because default is  empty string
  # post_deployment_script     = "${var.post_deployment_script}"

  sap_hana_sid             = "D10"
  sap_hana_instance_number = 10
  sap_hana_sidadm_password = "Google123"
  sap_hana_system_password = "Google123"
  sap_hana_sidadm_uid      = 900
  sap_hana_sapsys_gid      = 900
}
