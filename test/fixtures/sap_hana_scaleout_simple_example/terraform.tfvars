instance_name = "uscl6hdbhso"
instance_type = "n1-highmem-16"
zone = "us-west1-b"
subnetwork = "sap-dev-demo1"
project_id = "ajayarvind-sap-hana-standalone"
region = "us-west1"
linux_image_family = "sles-12-sp3-sap"
linux_image_project = "suse-sap-cloud"
sap_hana_deployment_bucket = "hana-gcp-20/hana20sps03"
sap_hana_sidadm_password = "Google123"
sap_hana_system_password = "Google123"
sap_hana_sidadm_uid = 900
sap_hana_sapsys_gid = 900
instance_count_worker = 2
worker_address_count_ip = 2
sap_hana_scaleout_nodes = 2
instance_count_master = 1
autodelete_disk = "true"
boot_disk_size = 450
boot_disk_type = "pd-ssd"
disk_type = "pd-ssd"
service_account_email = "hana-scale-up@ajayarvind-sap-hana-standalone.iam.gserviceaccount.com"
network_tags = []
device_name_boot = "-boot"
device_name_pd_ssd = "-pdssd"
