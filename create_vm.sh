#!/bin/bash

# Function to ask for VM name
get_vm_name() {
  echo "Please enter a name for your VM: "
  read VM_NAME
  echo "VM Name: $VM_NAME"
}

# Function to ask for distribution choice
choose_distribution() {
  echo "Choose a distribution (number):"
  echo "1) Ubuntu 20.04"
  echo "2) Ubuntu 22.04"
  echo "3) CentOS 8"
  echo "4) Debian 11"
  read -p "Enter choice [1-4]: " DISTRO_CHOICE

  case $DISTRO_CHOICE in
    1)
      DISTRO="ubuntu/bionic64"
      VERSION="20.04"
      ;;
    2)
      DISTRO="ubuntu/jammy64"
      VERSION="22.04"
      ;;
    3)
      DISTRO="centos/8"
      VERSION="8"
      ;;
    4)
      DISTRO="debian/bullseye64"
      VERSION="11"
      ;;
    *)
      echo "Invalid choice, defaulting to Ubuntu 20.04."
      DISTRO="ubuntu/bionic64"
      VERSION="20.04"
      ;;
  esac
  echo "Chosen Distro: $DISTRO, Version: $VERSION"
}

# Function to create a Vagrantfile and launch Vagrant VM
launch_vagrant_vm() {
  echo "Creating VM directory for $VM_NAME..."
  

  # Export the VM name and distro as environment variables
  export VM_NAME
  export DISTRO
  export LIBVIRT_URI
  export NETWORK_INTERFACE="wlp7s0"

  # Use envsubst to replace placeholders in Vagrantfile.template
  echo "Creating Vagrantfile from template..."
  cd vagrant
  echo "Launching Vagrant VM..."
  vagrant up --provision
}


# Main function to execute the flow
main() {
  get_vm_name
  choose_distribution
  launch_vagrant_vm
}

# Execute main function
main
