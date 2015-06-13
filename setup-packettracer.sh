#! /bin/sh

#
# Add desktop file and mime info for Cisco Packet Tracer
#

echo '[Desktop Entry]
Version=1.0
Type=Application
Name=Cisco Packet Tracer
Comment=Network simulation tool
GenericName=Cisco Packet Tracer
Exec=/opt/packettracer/packettracer
Icon=/opt/packettracer/art/app.png
Categories=GTK;Network;
StartupNotify=true
Terminal=false
MimeType=application/x-pkt;application/x-pka;application/x-pkz;' > /usr/share/applications/packettracer.desktop

update-desktop-database
