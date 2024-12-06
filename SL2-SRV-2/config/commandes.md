
enable

conf t

#configurer les vlans

vlan 30
name SRV

#configurer les interfaces physiques

interface gigabitEthernet 0/0
switchport trunk encapsulation dot1q
switchport mode trunk
exit

interface range gigabitEthernet 0/1 - 2
switchport mode access
switchport access vlan 30
end

copy running-config startup-config
