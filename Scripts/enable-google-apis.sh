#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 29/11/2024        #
############################
reset="\e[0m"
red="\e[31m"
green="\e[32m"

required_apis=(
    "sqladmin.googleapis.com"
    "container.googleapis.com"
    "compute.googleapis.com"
    "cloudresourcemanager.googleapis.com"
    "iam.googleapis.com"
    "iamcredentials.googleapis.com"
    "servicenetworking.googleapis.com"
)

function error_exit() { # Functie: Error afhandeling.
    clear
    echo -e "${red}$1${reset}"
    exit 1
}

function success_exit() { # Functie: Succes afhandeling.
    clear
    echo -e "${green}$1${reset}"
    exit 0
}

function enable_apis() { # Functie: Enable the required APIs.
    local EXIT_CODE=0

    for api in "${required_apis[@]}"; do
        gcloud services enable "$api"
        EXIT_CODE=$((EXIT_CODE + $?))
    done

    if [ $EXIT_CODE -eq 0 ]; then success_exit "APIs enabled successfully."; else error_exit "Failed to enable the APIs."; fi
}

function main() { # Functie: Main functie.
    clear
    echo "*****************************************************************************"
    echo -e "*${green} Welcome to the Google APIs enabler.${reset}                                       *"
    echo -e "*${green} This script will enable the required APIs for the Google Cloud Platform.${reset}  *"
    echo -e "*${green} Please make sure you have the necessary permissions to enable the APIs.${reset}   *"
    echo -e "*${green} Press enter to continue.${reset}                                                  *"
    echo "*****************************************************************************"
    read -r
    enable_apis
}

main