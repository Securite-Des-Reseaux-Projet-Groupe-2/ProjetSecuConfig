```
enable

conf t

# Configurations des Vlans
vlan 10
name SEC
exit

# ARP Cache Poisoning
ip dhcp snooping
ip dhcp snooping vlan 10
ip arp inspection vlan 10
#ip arp inspection static <ip address> <MAC adress> vlan <vlan id> <untrusted interface interface>
#ip dhcp snooping binding <ip address> <MAC adress> vlan <vlan id> <untrusted interface interface>


# Création d'un utilisateur Admin avec les privilèges admins
username admin privilege 15 secret cisco
username helpdesk privilege 1 secret cisco

#Nome de domaine
ip domain-name  meditechbelgica.local

# Accès SSH sécurisé
line vty 0 4
login local
transport input ssh
exit
crypto key generate rsa
2048
ip ssh version 2

# Configurations des interfaces physiques
interface gigabitEthernet 0/0

switchport trunk encapsulation dot1q
switchport mode trunk
ip arp inspection trust
ip dhcp snooping trust
exit

interface range gigabitEthernet 0/1 - 2

switchport mode access
switchport access vlan 10
no ip arp inspection trust
no ip dhcp snooping trust
ip dhcp snooping limit rate 10
spanning-tree bpduguard
spanning-tree guard root
no cdp enable

end
```
