#! /bin/bash

#### set services servera
   ssh student@servera sudo dnf install nfs-utils
   ssh student@servera sudo systemctl enable --now nfs-server

#### set serverb
