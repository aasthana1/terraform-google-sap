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
 * See the License for the specific language governing permissivariable "sap_hana_deployment_bucket" {
   description = "SAP hana deployment bucket"
 }
ons and
 * limitations under the License.
 */
primary_instance_name = "sap-hana-ha-terra-1"
primary_instance_ip = "gcp-primary-instance-ip"
secondary_instance_ip = "gcp-secondary-instance-ip"
sap_vip_internal_address = "sap-vip-internal-address"
secondary_instance_name = "sap-hana-ha-terra-2"
instance_type = "n1-megamem-96"
primary_zone = "us-central1-a"
secondary_zone = "us-central1-b"
subnetwork = "sap-dev-demo"
project_id = "ajayarvind-sap-hana-standalone"
region = "us-central1"
linux_image_family = "sles-12-sp3-sap"
linux_image_project = "suse-sap-cloud"
sap_hana_deployment_bucket = "hana-gcp-20/hana20sps03"
post_deployment_script = ""
sap_hana_sid = "D00"
sap_hana_instance_number = 00
sap_hana_sidadm_password = "Google123"
sap_hana_system_password = "Google123"
sap_hana_sidadm_uid = 900
sap_hana_sapsys_gid = 900
sap_vip = "10.0.0.73"
sap_vip_secondary_range = ""
sap_hana_scaleout_nodes = 0
instance_count_master = 1
boot_disk_size = 300
boot_disk_type = "pd-ssd"
disk_type = "pd-ssd"
service_account_email = "hana-scale-up@ajayarvind-sap-hana-standalone.iam.gserviceaccount.com"
network_tags = ["foo"]
