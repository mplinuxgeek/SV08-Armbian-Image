#!/bin/bash

# Define the username, output directory, and log file
username="sovol"
output_dir="/home/sovol/printer_data/config"
log_file="$output_dir/$username"
reset_trigger="$output_dir/reset_password"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User $username does not exist."
    exit 1
fi

# Check if a password reset is required or if no password is set
if [ -f "$reset_trigger" ] || passwd -S "$username" | grep -q ' NP '; then
    # Generate a random password
    random_password=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c14)

    # Set the password for the user
    echo "$username:$random_password" | sudo chpasswd

    # Overwrite the log file with the new password information
    echo "User: $username - Password: $random_password - Set on: $(date)" > "$log_file"
    echo "Password set for $username and logged to $log_file."

    # Remove the reset trigger file if it exists
    [ -f "$reset_trigger" ] && rm "$reset_trigger"
else
    echo "User $username already has a password set and no reset was requested."
fi
