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

resource "random_id" "random_suffix" {
  byte_length = 4
}

locals {
  gcs_bucket_name        = "post-deployment-bucket-${random_id.random_suffix.hex}"
  gcs_bucket_static_name = "hana-gcp-20/hana20sps03"
}

#TODO: Add creation of a network that's similar to app2

resource "google_storage_bucket" "deployment_bucket" {
  name          = "${local.gcs_bucket_name}"
  force_destroy = true
  location      = "${var.region}"
  storage_class = "REGIONAL"
  project       = "${var.project_id}"
}

data "template_file" "post_deployment_script" {
  template = "${file("${path.cwd}/files/templates/post_deployment_script.tpl")}"

  vars = {
    # sap_hana_sid needs to be lower case to work with `su -[SID]adm` command
    sap_hana_sid = "${lower(module.example.sap_hana_sid)}"
  }
}

data "template_file" "startup_sap_hana_primary" {
  template = "${file("${path.module}/files/sap_hana.sh")}"
}

data "template_file" "startup_sap_hana_secondary" {
  template = "${file("${path.module}/files/sap_hana_secondary.sh")}"
}

resource "google_storage_bucket_object" "post_deployment_script" {
  name    = "post_deployment_script.sh"
  content = "${data.template_file.post_deployment_script.rendered}"
  bucket  = "${google_storage_bucket.deployment_bucket.name}"
}

module "example" {
  source                     = "../../../examples/sap_hana_scaleout_simple_example"
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
  sap_hana_sidadm_password   = "${var.sap_hana_sidadm_password}"
  sap_hana_system_password   = "${var.sap_hana_system_password}"
  sap_hana_scaleout_nodes    = "${var.sap_hana_scaleout_nodes}"
  zone                       = "${var.zone}"
  instance_count_master      = "${var.instance_count_master}"
  instance_count_worker      = "${var.instance_count_worker}"
  instance_name              = "${var.instance_name}"
  device_name_boot           = "${var.device_name_boot}"
  device_name_pd_ssd         = "${var.device_name_pd_ssd}"
  startup_script_1           = "${data.template_file.startup_sap_hana_primary.rendered}"
  startup_script_2           = "${data.template_file.startup_sap_hana_secondary.rendered}"
  sap_hana_deployment_bucket = "${local.gcs_bucket_static_name}"
  post_deployment_script     = "${google_storage_bucket.deployment_bucket.url}/${google_storage_bucket_object.post_deployment_script.name}"
}
