configure terminal

# Création du VLAN
vlan 100
name DMZ
no shut
exit

#Interface VLAN avec adresse IP
interface Vlan 100
ip address 10.100.0.254 255.255.255.0
no shut

interface fastEthernet 1/0
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit

interface FastEthernet0/0
ip address 10.1.0.10 255.255.255.252
no shut
exit

router ospf 1
 network 10.1.0.0 0.0.0.3 area 0
 network 10.100.0.0 0.0.0.255 area 0

end

copy running-config startup-config
