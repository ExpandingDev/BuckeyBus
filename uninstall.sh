#!/bin/bash

source /etc/buckey/buckey-setup.conf

remove_buckey_user() {
	if id -u ${BUCKEY_RUN_USER} >/dev/null 2>&1; then
		if deluser ${BUCKEY_RUN_USER} ; then
			echo "Removed user '${BUCKEY_RUN_USER}'..."
		else
			echo "Failed to remove the '${BUCKEY_RUN_USER}' user!"
			exit -1
		fi
	else
		echo "WARNING: Could not find the '${BUCKEY_RUN_USER}' user, moving on..."
	fi
}

remove_buckey_bus_user() {
	if id -u ${BUCKEY_BUS_RUN_USER} >/dev/null 2>&1; then
		if deluser ${BUCKEY_BUS_RUN_USER} ; then
			echo "Removed user '${BUCKEY_BUS_RUN_USER}'..."
		else
			echo "Failed to remove the '${BUCKEY_BUS_RUN_USER}' user!"
			exit -1
		fi
	else
		echo "WARNING: Could not find the '${BUCKEY_BUS_RUN_USER}' user, moving on..."
	fi
}

remove_buckey_directories() {
	echo "Removing Buckey directories"
	rm -vrf /etc/buckey
	rm -vrf /var/log/buckey
	echo "Directories removed."
}

echo "Buckey uninstaller"

remove_buckey_user
remove_buckey_bus_user
remove_buckey_directories

echo "DONE"
