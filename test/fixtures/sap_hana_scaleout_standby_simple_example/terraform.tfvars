instance_name = "uscl4hdbhso-py"

instance_type = "n1-highmem-96"

zone = "us-central1-b"

subnetwork = "sap-dev-demo"

project_id = "ajayarvind-sap-hana-standalone"

region = "us-central1"

linux_image_family = "sles-12-sp3-sap"

linux_image_project = "suse-sap-cloud"

sap_hana_deployment_bucket = "hana-gcp-20/HANA20SPS03REV33"

sap_deployment_debug = "true"

post_deployment_script = ""

sap_hana_sid = "H22"

sap_hana_instance_number = "00"

sap_hana_sidadm_password = "Google123"

sap_hana_system_password = "Google123"

sap_hana_sidadm_uid = 900

sap_hana_sapsys_gid = 900

instance_count_worker = 3

worker_address_count_ip = 3

sap_hana_scaleout_nodes = 3

sap_hana_total_nodes = 4

instance_count_master = 1

autodelete_disk = "true"

boot_disk_size = 450

boot_disk_type = "pd-ssd"

disk_type = "pd-ssd"

service_account = "terraform-google-sap@ajayarvind-sap-hana-standalone.iam.gserviceaccount.com"

network_tags = []

sap_hana_original_role = "master"

sap_hana_orgiginal_role = "worker"

sap_hana_shared_nfs = "10.242.65.98:/hanashared"

sap_hana_backup_nfs = "10.230.227.18:/hanabackup"

sap_hana_worker_nodes = 2

sap_hana_standby_nodes = 1

min_cpu_platform = "Intel Broadwell"

device_name_boot = "-boot"

device_name_pd_ssd = "-mnt00001"
