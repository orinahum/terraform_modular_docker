#!/usr/bin/env bash
#########################################################################
# Created by Ori Nahum and Avishay Layani
# Purpose: Runs deployment using Terraform and Ansible
# Version: 0.0.2
# Date: 03/11/2024
# set -x          # Enable debug mode
set -o errexit  # Exit on any command failing 
set -o pipefail # Return non-zero status if any part of a pipeline fails
#########################################################################

clear
printf "
████████╗███████╗██████╗ ██████╗  █████╗ ███████╗ ██████╗ ██████╗ ███╗   ███╗                                    
╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗████╗ ████║                                    
   ██║   █████╗  ██████╔╝██████╔╝███████║█████╗  ██║   ██║██████╔╝██╔████╔██║                                    
   ██║   ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║                                    
   ██║   ███████╗██║  ██║██║  ██║██║  ██║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║                                    
   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝                                    
                                                                                                                 
██╗███╗   ██╗███████╗██████╗  █████╗ ███████╗████████╗██████╗ ██╗   ██╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗
██║████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝
██║██╔██╗ ██║█████╗  ██████╔╝███████║███████╗   ██║   ██████╔╝██║   ██║██║        ██║   ██║   ██║██████╔╝█████╗  
██║██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║██║        ██║   ██║   ██║██╔══██╗██╔══╝  
██║██║ ╚████║██║     ██║  ██║██║  ██║███████║   ██║   ██║  ██║╚██████╔╝╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗
╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝                                                                                                               
"

# Starting prerequisite checks
echo "Starting prerequisite checks..."
sleep 1

# Verify if Terraform is installed
( which terraform &> /dev/null && echo "[+] Terraform is available" ) || \
    ( echo "[-] Terraform executables not found, exiting" && exit 1 )

# Verify if Docker is installed
( which docker &> /dev/null && echo "[+] Docker is available" ) || \
    ( echo "[-] Docker executables not found, exiting" && exit 1 )

# Verify if Ansible Playbook is installed
( which ansible-playbook &> /dev/null && echo "[+] Ansible-Playbook is available" ) || \
    ( echo "[-] Ansible Playbook not found, exiting" && exit 2 )

## Uninstall option
# Check if the script is run with the --uninstall option to destroy the infrastructure
if [[ "$1" == "--uninstall" ]]; then
  echo "Starting Terraform destroy..."
  if ! terraform -chdir=terraform/ destroy -auto-approve; then
    # Output error message if destroy fails
    echo "[-] Failed to destroy the infrastructure: $(terraform -chdir=terraform/ destroy -auto-approve 2>&1)"
    exit 1
  fi
  echo "[+] Successfully destroyed the infrastructure"
  exit 0
fi

# Initializing terraform 
terraform -chdir=terraform/ init

# Apply Terraform configuration in the terraform folder and output the plan to a log file
terraform -chdir=terraform/ apply -auto-approve | tee terraform/terraform_apply_output.log

# Run the Ansible playbook to modify NGINX configuration
ansible-playbook ansible_nginx/nginx_playbook.yaml --ask-become-pass

# Opens the browser with the fake DNS name (Created in the Ansible Playbook)
open http://www.hello_alex.com &> /dev/null
