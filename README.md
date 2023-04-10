# tf_redhat9
This repository set up a minimum configuration to practice RHCSA (Red Hat Certificafied System Admin), RHEL9 admin RH200 RHCSA (RH200VT) 
  - set up two servers, servera, serverb
  - add extra block device to practice partitioning storage
  - add user student with public key (provide your own public key)
  - add NFS server in serverb to practice NFS mounts

Prerequisites.
  - aws account.
  - config your aws cli in your workstation (could be a workstation in aws)
  - install terraform
  - clone the repo 
  
Set up your RHEL9 laboratory in aws with terraform.
  - Add your public (.ssh/id_rsa.pub) id in /scripts/default_server.yaml
  - run > terraform apply
  - run ./toolkit/set_hostnames.sh to config hostnames in local workstation and servers.
  - run ./toolkit/set_services.sh  to config services in serverb (NFS) and practice from servera 

Important labs you could practice.
  - Create users and groups and set shared folders.
  - selinux troobleshouting. Set a http server with /example root docs folder.
  - Containers service installation as a user service, for example mariadb from RedHat9 repo: registry.redhat.io/rhel9/mariadb-105 
  - LVM storage creation and extensions, use second device.
  - Add second swap, and include new LVM disks in fstab.
  - NFS directs and indirects mounts from servera mount shared folder in serverb:/
  - Change internal IPs of serverb and try to reach it from servera.
  - set hostname and a second ntp master server.
