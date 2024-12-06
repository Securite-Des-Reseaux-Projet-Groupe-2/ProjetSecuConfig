
enable

conf t

#configurer les vlans

vlan 20
name MED

#configurer les interfaces physiques

interface gigabitEthernet 0/0
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface range gigabitEthernet 0/1 - 2
switchport mode access
switchport access vlan 20

int vlan 20
ip address 10.1.2.241 255.255.255.0
no shut
exit

end

copy running-config startup-config
