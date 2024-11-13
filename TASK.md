<img src="assets/TASK.png" alt="TASK.md" style="width: 100%; height: 250px;">

# Terraform Single file docker task

Create terraform project file that will start multi container environment with nginx as loadbalancer and ssl configuration to be implemented.

### Tasks

- Create 2 contatiners:
    - nginx with https to forward to other container
    - app container to answer with `hello world` back to the requester
- Create terraform file `main.tf`:
    - run above mentioned containers
    - verify that there is dns redirection with /etc/hosts to some fake dns name (use your imagination)
    - print out the ip address of nginx container


### Notes

- most of the work is not terraform
