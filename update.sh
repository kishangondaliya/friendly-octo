#!/bin/sh

# First argument of script will be update directory location of upadte files
update_dir=$1
cortex_firmware_home="/cortex"


########## Start update #############
echo "Updating from directory: $update_dir"

# Go to cortex firmware codebase
cd $cortex_firmware_home

if [ $? -eq 0 ]; then
   echo Navigating into cortex home directory
else
   echo Cortex firmware home directory do not exist
   exit 1
fi

# Apply patch file
patch_file="$update_dir/update.patch"
patch -p1 < $patch_file

if [ $? -eq 0 ]; then
   echo Patch applied successfully
else
   echo Patch applying failed
   exit 1
fi
# Install new packages
#pkg_name="$update_dir/package.ipk"
#opkg install $pkg_name
