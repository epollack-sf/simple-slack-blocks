#!/bin/bash

NAME=$(hostname | cut -d "-" -f 1)

# create matching backup directory
mkdir /mnt/c/Users/$NAME/Desktop/'FwF Backups'/$1

mv $1/* /mnt/c/Users/$NAME/Desktop/'FwF Backups'/$1