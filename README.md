# Buckey Bus
A set of scripts and configuration files to run a custom DBus daemon.

# Usage
To install the Buckey DBus configuration, modify the options in the `buckey-setup.conf` file and then run `setup.sh`. This will create any needed directories, and install custom logging rules if rsyslog is detected on your system.
To uninstall the Buckey DBus configuration, run the `uninstall.sh` script to remove all files and directories created during setup.
To start the Buckey DBus daemon, run the `start-buckey-bus.sh` script. It will print out the PID of the daemon.

## Purpose
DBus usually requires an desktop session to be running to set the environmental variables and start the session bus. This is not always optimal for running DBus reliant programs on a headless server. Additionally, connecting Buckey services/programs to the session or system buses may produce extra noise that is not desirable to be repeated over remote connections. Because remote connections to one central DBus is a future goal, it is best to minimize uneeded traffic, so creating an isolated DBus for Buckey programs is desirable.
