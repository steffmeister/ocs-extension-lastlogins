# ocs-extension-lastlogins
OCS Extensions to get the last logins to a windows machine

## Installation

- Copy the dir to /var/lib/ocsinventory-reports/extensions/
- Install via webgui (Extensions)
- Run install_plugin.py from "/usr/share/ocsinventory-reports/ocsreports/tools", you may have to install python3 ("yum install python3" and then "pip-3 install scp").
It may asks you about a directory for plugins, eg "/var/lib/ocsinventory-reports/extensions/" and a server location path, eg "/etc/ocsinventory/ocsinventory-server".
- Restart the web server
- distribute the vbs (located in agent subdirectory here) among your clients (eg GPO).

More information also found here: https://wiki.ocsinventory-ng.org/10.Plugin-engine/Using-plugins-installer/

## About

You can find more information about me or other software on my homepage: https://software.steffmeister.at/