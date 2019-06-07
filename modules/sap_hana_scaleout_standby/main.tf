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

terraform {
  required_version = "~> 0.11.0"
}

module "sap_hana" {
  source        = "./sap_hana_python"
  instance-type = "${var.instance_type}"
}

resource "google_compute_address" "gcp_master_ip" {
  project = "${var.project_id}"
  count   = "${var.instance_count_master}"
  name    = "gcp-master-instance-ip"
  region  = "${var.region}"
}

resource "google_compute_address" "gcp_worker_ip" {
  project = "${var.project_id}"
  count   = "${var.instance_count_worker}"
  name    = "gcp-worker-${format("%01d", count.index + 1)}-ip"
  region  = "${var.region}"
}

resource "google_compute_disk" "gcp_sap_hana_sd_0" {
  project = "${var.project_id}"
  name    = "gcp-sap-hana-sd-0-${var.device_name_pd_ssd}"
  type    = "${var.disk_type}"
  zone    = "${var.zone}"
  size    = "${var.pd_ssd_size != "" ? var.pd_ssd_size : module.sap_hana.diskSize}"
}

resource "google_compute_disk" "gcp_sap_hana_sd_1" {
  project = "${var.project_id}"
  name    = "gcp-sap-hana-sd-1-${var.device_name_pd_ssd}"
  type    = "${var.disk_type}"
  zone    = "${var.zone}"
  size    = "${var.pd_ssd_size != "" ? var.pd_ssd_size : module.sap_hana.diskSize}"
}

resource "google_compute_disk" "gcp_sap_hana_sd_2" {
  project = "${var.project_id}"
  count   = "${var.instance_count_worker}"
  name    = "${var.instance_name}w-${count.index}-pdssd"
  type    = "${var.disk_type}"
  zone    = "${var.zone}"
  size    = "${var.pd_ssd_size != "" ? var.pd_ssd_size : module.sap_hana.diskSize}"
}

resource "google_compute_disk" "gcp_sap_hana_sd_3" {
  project = "${var.project_id}"
  count   = "${var.instance_count_worker}"
  name    = "${var.instance_name}-${count.index}-pdssd"
  type    = "${var.disk_type}"
  zone    = "${var.zone}"
  size    = "${var.pd_ssd_size != "" ? var.pd_ssd_size : module.sap_hana.diskSize}"
}

resource "google_compute_instance" "master" {
  project        = "${var.project_id}"
  count          = "${var.instance_count_master}"
  name           = "${var.instance_name}"
  machine_type   = "${var.instance_type}"
  zone           = "${var.zone}"
  tags           = "${var.network_tags}"
  can_ip_forward = true

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  boot_disk {
    auto_delete = "${var.autodelete_disk}"
    device_name = "${var.instance_name}${var.device_name_boot}"

    initialize_params {
      image = "projects/${var.linux_image_project}/global/images/family/${var.linux_image_family}"
      size  = "${var.boot_disk_size}"
      type  = "${var.boot_disk_type}"
    }
  }

  attached_disk {
    source = "${google_compute_disk.gcp_sap_hana_sd_0.self_link}"
  }

  attached_disk {
    source = "${google_compute_disk.gcp_sap_hana_sd_1.self_link}"
  }

  network_interface {
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${var.project_id}"

    access_config {
      nat_ip = "${element(google_compute_address.gcp_master_ip.*.address, count.index)}"
    }
  }

  metadata {
    sap_hana_deployment_bucket = "${var.sap_hana_deployment_bucket}"
    sap_deployment_debug       = "${var.sap_deployment_debug}"
    post_deployment_script     = "${var.post_deployment_script}"
    sap_hana_sid               = "${var.sap_hana_sid}"
    sap_hana_sidadm_uid        = "${var.sap_hana_sidadm_uid}"
    sap_hana_instance_number   = "${var.sap_hana_instance_number}"
    sap_hana_sidadm_password   = "${var.sap_hana_sidadm_password}"
    sap_hana_system_password   = "${var.sap_hana_system_password}"
    sap_hana_sapsys_gid        = "${var.sap_hana_sapsys_gid}"
    sap_hana_total_nodes       = "${var.sap_hana_total_nodes}"
    sap_hana_original_role     = "${var.sap_hana_original_role}"
    sap_hana_shared_nfs        = "${var.sap_hana_shared_nfs}"
    sap_hana_backup_nfs        = "${var.sap_hana_backup_nfs}"
    sap_hana_scaleout_nodes    = "${var.sap_hana_scaleout_nodes}"
    sap_hana_worker_nodes      = "${var.sap_hana_worker_nodes}"
    sap_hana_standby_nodes     = "${var.sap_hana_standby_nodes}"
    startup-script             = "${var.startup_script_primary}"
  }

  service_account {
    email  = "${var.service_account}"
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "worker" {
  project        = "${var.project_id}"
  count          = "${var.instance_count_worker}"
  name           = "${var.instance_name}w${count.index + 1}"
  machine_type   = "${var.instance_type}"
  zone           = "${var.zone}"
  tags           = "${var.network_tags}"
  can_ip_forward = true

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  boot_disk {
    auto_delete = "${var.autodelete_disk}"
    device_name = "${var.instance_name}w${count.index + 1}${var.device_name_boot}"

    initialize_params {
      image = "projects/${var.linux_image_project}/global/images/family/${var.linux_image_family}"
      size  = "${var.boot_disk_size}"
      type  = "${var.boot_disk_type}"
    }
  }

  attached_disk {
    source = "${element(google_compute_disk.gcp_sap_hana_sd_2.*.self_link, count.index + 1 )}"
  }

  attached_disk {
    source = "${element(google_compute_disk.gcp_sap_hana_sd_3.*.self_link, count.index + 1 )}"
  }

  network_interface {
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${var.project_id}"

    access_config {
      nat_ip = "${element(google_compute_address.gcp_worker_ip.*.address, count.index)}"
    }
  }

  metadata {
    sap_hana_deployment_bucket = "${var.sap_hana_deployment_bucket}"
    sap_deployment_debug       = "${var.sap_deployment_debug}"
    post_deployment_script     = "${var.post_deployment_script}"
    sap_hana_sid               = "${var.sap_hana_sid}"
    sap_hana_sidadm_uid        = "${var.sap_hana_sidadm_uid}"
    sap_hana_instance_number   = "${var.sap_hana_instance_number}"
    sap_hana_sidadm_password   = "${var.sap_hana_sidadm_password}"
    sap_hana_system_password   = "${var.sap_hana_system_password}"
    sap_hana_sapsys_gid        = "${var.sap_hana_sapsys_gid}"
    sap_hana_total_nodes       = "${var.sap_hana_total_nodes}"
    sap_hana_orgiginal_role    = "${var.sap_hana_orgiginal_role}"
    sap_hana_shared_nfs        = "${var.sap_hana_shared_nfs}"
    sap_hana_backup_nfs        = "${var.sap_hana_backup_nfs}"
    sap_hana_scaleout_nodes    = "${var.sap_hana_scaleout_nodes}"
    sap_hana_worker_nodes      = "${var.sap_hana_worker_nodes}"
    sap_hana_standby_nodes     = "${var.sap_hana_standby_nodes}"
    startup-script             = "${var.startup_script_secondary}"
  }

  service_account {
    email  = "${var.service_account}"
    scopes = ["cloud-platform"]
  }
}
