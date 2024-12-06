configure terminal

no ip routing

vlan 100
name DMZ
no shut
exit

interface range g 1/1 - 2
switchport mode access
switchport access vlan 100
no shut
exit

interface g 1/0
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit

int vlan100
ip address 10.100.0.241 255.255.255.0
no shut
exit

ip default-gateway 10.100.0.254
end

copy running-config startup-config
