
enable

conf t

#configurer les vlans

vlan 10
name SEC

#configurer les interfaces physiques

interface gigabitEthernet 0/0
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface range gigabitEthernet 0/1 - 2
switchport mode access
switchport access vlan 10

int vlan 10
ip address 10.1.1.241 255.255.255.0
no shut
exit

end

copy running-config startup-config
