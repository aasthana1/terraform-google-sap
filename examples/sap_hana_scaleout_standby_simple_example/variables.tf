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

variable "instance_name" {
  description = "Compute Engine instance name"
}

variable "instance_type" {
  description = "Compute Engine instance Type"
}

variable "zone" {
  description = "Compute Engine instance deployment zone"
}

variable "subnetwork" {
  description = "Compute Engine instance name"
}

variable "project_id" {
  description = "Project name to deploy the resources"
}

variable "region" {
  description = "Region to deploy the resources"
}

variable "linux_image_family" {
  description = "Compute Engine image name"
}

variable "linux_image_project" {
  description = "Project name containing the linux image"
}

variable "sap_hana_deployment_bucket" {
  description = "SAP hana deployment bucket"
}

variable "sap_deployment_debug" {
  description = "SAP hana deployment debug"
}

variable "post_deployment_script" {
  description = "SAP post deployment script"
  default     = ""
}

variable "sap_hana_sid" {
  description = "SAP hana SID"
}

variable "sap_hana_instance_number" {
  description = "SAP hana instance number"
}

variable "sap_hana_sidadm_password" {
  description = "SAP hana SID admin password"
}

variable "sap_hana_system_password" {
  description = "SAP hana system password"
}

variable "sap_hana_sidadm_uid" {
  description = "SAP hana sid adm password"
}

variable "sap_hana_sapsys_gid" {
  description = "SAP hana sap system gid"
}

variable "sap_hana_scaleout_nodes" {
  description = "SAP hana scaleout nodes"
}

variable "instance_count_master" {
  description = "Compute Engine instance count"
}

variable "instance_count_worker" {
  description = "Compute Engine instance count"
}

variable "autodelete_disk" {
  description = "Delete backend disk along with instance"
}

variable "boot_disk_size" {
  description = "Root disk size in GB"
}

variable "boot_disk_type" {
  description = "The type of data disk: PD_SSD or PD_HDD."
}

variable "disk_type" {
  description = "The GCE data disk type. May be set to pd-standard (for PD HDD) or pd-ssd."
  default     = ""
}

variable "pd_ssd_size" {
  description = "Persistent disk size in GB"
  default     = ""
}

variable "service_account" {
  description = "Service to run the terrform"
}

variable "network_tags" {
  type        = "list"
  description = "List of network tags"
}

variable "startup_script_primary" {
  description = "Startup script to install SAP HANA."
}

variable "startup_script_secondary" {
  description = "Startup script to install SAP HANA."
}

variable "device_name_boot" {
  description = "device name for boot disk"
}

variable "device_name_pd_ssd" {
  description = "device name for ssd persistant disk"
}

variable "sap_hana_original_role" {
  description = "sap_hana_original_role"
}

variable "sap_hana_orgiginal_role" {
  description = "sap_hana_orgiginal_role"
}

variable "sap_hana_shared_nfs" {
  description = "sap_hana_shared_nfs"
}

variable "sap_hana_backup_nfs" {
  description = "sap_hana_backup_nfs"
}

variable "sap_hana_worker_nodes" {
  description = "sap_hana_worker_nodes"
}

variable "min_cpu_platform" {
  description = "min_cpu_platform"
}

variable "sap_hana_total_nodes" {
  description = "SAP hana total nodes"
}

variable "sap_hana_standby_nodes" {
  description = "sap_hana_standby_nodes"
}
