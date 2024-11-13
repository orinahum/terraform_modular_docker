<img src="assets/README.png" alt="README.md" style="width: 100%; height: 250px;">

# Terraform Single file docker

This project sets up a multi-container environment using Terraform, Docker, and Ansible. It includes:

- **NGINX Load Balancer**: An NGINX container configured with SSL to act as a load balancer.
- **App Container**: A simple application container that responds with web page.
- **Ansible Automation**: Ansible is used to automate configurations and orchestrate the deployment process.

## Project Structure

```
.
├── INSTALLATION.md                # Guide to installing and setting up the project
├── LICENSE                        # License file for the project
├── README.md                      # Project overview and usage guide
├── SSLGUID.md                     # SSL certificate configuration guide
├── TASK.md                        # Task description and details
├── setup.sh                       # Main script for deploying or destroying the infrastructure
├── assets                         # Directory containing image files used in the project
│   ├── CONTRIBUTERS.png           # Image showing contributors or contributors' information
│   ├── INSTALLATION.png           # Image providing installation instructions or steps
│   ├── README.png                 # Image related to the README documentation
│   ├── SSLGUID.png                # Image with guidelines or information on SSL setup
│   └── TASK.png                   # Image depicting tasks or task-related instructions
├── ansible_nginx                  # Ansible playbooks and configurations for NGINX
│   ├── ansible.cfg                # Ansible configuration file
│   ├── files                      # Files for NGINX configuration
│   │   ├── nginx.conf             # NGINX configuration file
│   │   ├── server.crt             # SSL certificate for NGINX
│   │   └── server.key             # SSL certificate key for NGINX
│   └── nginx_playbook.yaml        # Ansible playbook for NGINX configuration
├── terraform                      # Terraform configurations for the infrastructure
│   ├── main.tf                    # Main Terraform configuration file
│   ├── modules                    # Terraform modules for different components
│   │   ├── app                    # Module for the application container
│   │   │   ├── main.tf            # Terraform configuration for the app module
│   │   │   ├── output.tf          # Outputs for the app module
│   │   │   ├── provider.tf        # Provider configuration for the app module
│   │   │   └── variables.tf       # Variables for the app module
│   │   └── nginx                  # Module for the NGINX container
│   │       ├── main.tf            # Terraform configuration for the NGINX module
│   │       ├── output.tf          # Outputs for the NGINX module
│   │       ├── provider.tf        # Provider configuration for the NGINX module
│   │       └── variables.tf       # Variables for the NGINX module
│   ├── output.tf                  # Outputs for the main Terraform configuration
│   ├── provider.tf                # Provider configuration for the main setup
│   └── variables.tf               # Variables for the main Terraform setup
```

## Branch Information

In this project, there is an additional branch called **app** that contains the `appweb` application. You can view it [here](https://github.com/orinahum/terraform_single_docker/tree/app).

## Installation

To install and deploy the project, please follow the instructions in the [INSTALLATION.md](INSTALLATION.md) file.

## Dependencies

- **Docker**: Required to run the application containers. [Docker Installation Guide](https://docs.docker.com/get-docker/)
- **Terraform**: Required to manage the infrastructure as code. [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **Ansible**: Required for configuration management and automation. [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **Git**: Required to clone the repository. [Git Installation Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Usage

1. **Modify Variables**: Adjust parameters like DNS name, port, and image names by modifying `variables.tf`.
2. **Deploy the Project**: Follow the steps in [INSTALLATION.md](INSTALLATION.md) to deploy the environment.
3. **Access the Application**: Once deployed, access the app using the configured DNS name.

## Uninstall

To uninstall and destroy all infrastructure, run:

```bash
./setup.sh --uninstall
```

This command will remove all resources created by the installation process.

## License

This project is licensed under the Unlicense. See the [LICENSE](LICENSE) file for details.

## Related Documents

- [Installation Guide (INSTALLATION.md)](INSTALLATION.md)
- [SSL Guide (SSLGUID.md)](SSLGUID.md)

## Acknowledgments

Special thanks to the [CONTRIBUTORS](CONTRIBUTORS.md) of this project.
