# VirtualBox Command Line Interaction

Rough notes on useful VirtualBox commands to manage VMs. Assumes you have
aliased vboxmanage to vbm.

## Basic Starting/Stopping Stuff

vbm list vms
- show the installed virtualbox

vbm list runningvms

vbm startvm <vm-id|vm-name>
- starts a VM instance with a running GUI

vbm startvm <vm-id|vm-name> --type headless
- start vm headless

vbm controlvm <vm-id|vm-name> poweroff

## Networking

vboxmanage guestproperty get debian /VirtualBox/GuestInfo/Net/0/V4/IP

- this only seems to work if the extensions are installed in the guest.

## Snapshots
vbm snapshot <vm-id|vm-name> list
- list

vbm snapshot <vm-id|vm-name> restore <snapshot-name>
- revert

vbm snapshot <vm-id|vm-name> take <snapshot-name>
- new

## Guest Extensions
Install Guest Extensions
- install openssh-server
- sudo sh /media/cdrom/VBoxLinuxAdditions.run
- add more CPUS
- Display / Screen / Acceleration

## Networking commands

ip link show
- shows the interfaces

ip route(s)?
- shows the routing table

ip addr
- shows the IP addresses
