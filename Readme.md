# Debian Post-Install

Post-installation scripts for Debian stable.

## Base

  - Install some applications (tree, mtr, nmap, vim...)
  - Configure Bash (prompt, alias, options, completion)
  - Configure Apt sources (main, contrib, non-free, backports)
  - Configure Nano (syntax highlighting)
  - Configure Vim (syntax highlighting)
  - Configure Minicom (serial port)
  - Remove persistent network interface in udev
  - Install VirtualBox guest additions (optionnal)
  - Zero Grub timeout (optionnal)
  - Remove UUID in Grub (optionnal)
  
## Gnome
  
  - Remove unwanted applications
  - Install useful applications (Wireshark, VirtualBox, Flash...)
  - Setup Gnome Shell (background, extensions...)
  
## Addons

  - Install optionnal services (NTP, SNMP, SysLog-NG)

## IUT

  - Configure system banners
  - Configure Apt to use our local mirror server (optionnal)
  - Configure Ntp to use our local mirror server (optionnal)
  - Configure Cntlm to use our local proxy server (optionnal)
