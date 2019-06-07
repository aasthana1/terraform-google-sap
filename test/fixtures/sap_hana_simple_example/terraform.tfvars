service_account_email = "terraform-google-sap@ajayarvind-sap-hana-standalone.iam.gserviceaccount.com"

project_id = "ajayarvind-sap-hana-standalone"

instance_name = "cft-sap-hana-simple-py"

instance_type = "n1-ultramem-160"

linux_image_family = "sles-12-sp3-sap"

linux_image_project = "suse-sap-cloud"

disk_type = "pd-ssd"

boot_disk_type = "pd-ssd"

boot_disk_size = 64

autodelete_disk = "true"

subnetwork = "default"

network_tags = ["foo"]

sap_hana_system_password = "Google123"

sap_hana_sidadm_password = "Google123"

sap_hana_deployment_bucket = "hana-gcp-20/hana20sps03"
