# tf_redhat9
This repository set up a minimum configuration to practice RHEL9 admin RH200 RHCSA Rapid Track Exam Voucher (RH200VT) 
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
  - run > terraform apply
  - run ./toolkit/set_hostnames.sh to config hostnames in local workstation and servers.
  - run ./toolkit/set_services.sh  to config services in serverb (NFS) and practice from servera 
