#!/bin/bash

# Initialize tool directory and current directory
mkdir -p "/home/kali/Downloads/cptc"
cd "/home/kali/Downloads/cptc"

# Download Sliver-Client
URL1="https://github.com/BishopFox/sliver/releases/download/v1.5.41/sliver-client_linux"

FILENAME1="sliver-client"

wget "$URL1" -O "/home/kali/Downloads/cptc/$FILENAME1"

if [ $? -eq 0 ]; then

    chmod u+x "/home/kali/Downloads/cptc/$FILENAME1"
    echo "File $FILENAME has successfully downloaded. Execute permission has been granted."

else
    echo "File $FILENAME1 has not successfully downloaded."

fi

# # Download SUGMANATS and configuration file
# URL2="https://github.com/dbaseqp/SUGMANATS"
# 
# FILENAME2="SUGMANATS"
# 
# URL3="https://raw.githubusercontent.com/nationalcptc-teamtools/Fullerton-College/main/config.conf"
# 
# FILENAME3="config.conf"
# 
# git clone "$URL2" /home/kali/Downloads/cptc/SUGMANATS/
# 
# if [ $? -eq 0 ]; then
# 
#     echo "SUGMANATS has sucessfully been cloned."
#     
#     cd /home/kali/Downloads/cptc/SUGMANATS/
#     wget "$URL3" -O /home/kali/Downloads/cptc/SUGMANATS/config.conf
#     go build
# 
#     echo "Configuration file has successfully been downloaded and placed."
# else
# 
#     echo "SUGMANATS has not successfully been cloned. Configuration file has not successfully been downloaded and placed."
# fi
# 
    


		






