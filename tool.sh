#!/bin/bash

# Function to generate a random password
generate_password() {
    echo "Generating a random password..."
    pwgen -s 14 1
}

# Function to check internet connectivity
check_internet() {
    echo "Checking internet connectivity..."
    ping -c 1 google.com &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Internet is reachable."
    else
        echo "Internet is not reachable."
    fi
}

# Function to display system information
system_info() {
    echo "Displaying system information..."
    uname -a
    echo "CPU Info:"
    cat /proc/cpuinfo | grep "model name" | uniq
    echo "Memory Info:"
    free -h
    echo "Disk Usage:"
    df -h
}

# Main menu
while true; do
    echo "Multi-Tool Menu:"
    echo "1. Generate Random Password"
    echo "2. Check Internet Connectivity"
    echo "3. Display System Information"
    echo "4. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) generate_password ;;
        2) check_internet ;;
        3) system_info ;;
        4) echo "Exiting..."; exit ;;
        *) echo "Invalid option. Please select a valid option." ;;
    esac
done
