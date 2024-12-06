```
enable

conf t

hostname SL2-SRV-2

#configurer les vlans

vlan 30
name SRV
exit

#configurer les interfaces physiques

interface gigabitEthernet 0/0
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface range gigabitEthernet 0/1 - 2
switchport mode access
switchport access vlan 30

int vlan 30
ip address 10.1.3.242 255.255.255.0
no shut
exit

# ARP Cache Poisoning
ip dhcp snooping
ip dhcp snooping vlan 30
ip arp inspection vlan 30
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
switchport access vlan 30
no ip arp inspection trust
no ip dhcp snooping trust
ip dhcp snooping limit rate 10
switchport port-security  
switchport port-security maximum 2  
switchport port-security violation restrict  
switchport port-security mac-address sticky 
spanning-tree bpduguard
spanning-tree guard root
no cdp enable

end
copy running-config startup-config
```
