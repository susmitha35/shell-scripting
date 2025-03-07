#!/bin/bash

# Define users and their passwords
USERS=("user1" "user2" "user3" "user4" "user5")
PASSWORD="Passwo234"

# Loop through each user
for USER in "${USERS[@]}"; do
    # Create user with home directory
    sudo useradd -m "$USER"
    
    # Set password for user
    echo "$USER:$PASSWORD" | sudo chpasswd
    
    # Set environment variable in .bashrc
    echo "export MY_ENV_VAR='Hello from $USER'" | sudo tee -a /home/$USER/.bashrc
    
    # Create 100 folders in the user's home directory
    for i in {1..100}; do
        sudo mkdir -p /home/$USER/folder$i
    done
    
    # Change ownership of the home directory to the user
    sudo chown -R $USER:$USER /home/$USER
done

echo "Users created, passwords set, environment variables added, and folders created."
		
