#!/bin/sh

# Setup desktop icon for MPLAB X to run with elevated permissions
# This is needed for successful usage of MCC v5.2.x that ships
# with MPLAB X v6.05
#
# Run once to setup system.  Update MPLABX_VERSION variable and
# re-run for additional versions that are installed.
#
# John Haroian
# January 19, 2023

# Set to MLPAB X version for setup
MPLABX_VERSION=6.05

# Desktop file name
DESKTOP_FILE_NAME=${HOME}/Desktop/mplab_ide-v${MPLABX_VERSION}.desktop

# Script file name
SCRIPT_FILE_NAME=${HOME}/.local/bin/mplabx-v${MPLABX_VERSION}-admin.sh

# Copy .desktop file to Desktop folder for current user
cp /usr/share/applications/mplab_ide-v${MPLABX_VERSION}.desktop ${HOME}/Desktop

# Modify Exec with sed
sed "s|/opt/microchip/mplabx/v${MPLABX_VERSION}/mplab_platform/bin/mplab_ide|${HOME}/.local/bin/mplabx-v${MPLABX_VERSION}-admin.sh|" \
  <${DESKTOP_FILE_NAME} >${DESKTOP_FILE_NAME}.1

# Modify Icon with sed
sed "s|mplab_ide-v${MPLABX_VERSION}.png|/usr/share/icons/mplab_ide-v${MPLABX_VERSION}.png|" \
 <${DESKTOP_FILE_NAME}.1 >${DESKTOP_FILE_NAME}.2

# Modify Name with sed
sed "s|Name=MPLAB X IDE v${MPLABX_VERSION}|Name=MPLAB X v${MPLABX_VERSION} - root|" \
 <${DESKTOP_FILE_NAME}.2 >${DESKTOP_FILE_NAME}.3

# Clean up and rename
mv ${DESKTOP_FILE_NAME}.3 ${DESKTOP_FILE_NAME}
rm ${DESKTOP_FILE_NAME}.1
rm ${DESKTOP_FILE_NAME}.2

# Modify Trust metadata on new desktop file
gio set ${DESKTOP_FILE_NAME} metadata::trusted true

# Set desktop file to execute
chmod a+x ${DESKTOP_FILE_NAME}

# Make sure .local/bin exists
mkdir -p ${HOME}/.local/bin

# Modify and copy script for desktop file
sed "s|{VERSION}|v${MPLABX_VERSION}|" < `dirname $0`/mplabx-admin.sh >${SCRIPT_FILE_NAME}

# Set script to execute
chmod +x ${SCRIPT_FILE_NAME}
