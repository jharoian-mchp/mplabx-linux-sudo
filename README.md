# Run MPLAB X as root on Linux

**First, this is not a good or recommended practice.**  

Currently, running MPLAB X as root is a need due to an issue with the current version of MCC (v5.2.x) that ships with MPLAB X v6.05.

The script in this repo sets up a desktop icon that launches MPLAB X with elevated privileges so that MCC will launch successfully.  The issue is expected to be fixed in a future MCC release.

## Requirements

- Ubuntu 18.04 or greater - tested on Ubuntu 18.04
- MPLAB X v6.05 or greater needs to be installed

## Usage

Clone the repo in a temporary directory.  It can be deleted after running the setup script.

```
cd ~/Downloads
git clone https://github.com/jharoian-mchp/mplabx-linux-sudo.git
```

 Change into the cloned directory and run the script.

```
cd mplabx-linux-sudo.git
./setup.sh
```

An icon will be placed on the desktop:

![MPLAB X Icon on Desktop](https://raw.githubusercontent.com/jharoian-mchp/mplabx-linux-sudo/main/images/MPLABX-icon.png)

Use this icon to launch MPLAB X.  

Once MPLAB X is executed with elevated privileges, it touches and writes a number of configuration and project files that will now be owned by root.

After confirming that the icon and MCC work as anticipated, delete the cloned folder.

```
cd ..
rm -rf mplabx-linux-sudo.git
```

