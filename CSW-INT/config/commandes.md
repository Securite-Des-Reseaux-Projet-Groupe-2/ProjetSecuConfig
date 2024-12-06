```
conf t

#configuration des vlan 

vlan 10
name SEC
exit

vlan 20
name MED
exit

vlan 30
name SRV
exit

#configurations des interfaces vlan

interface vlan 10
ip address 10.1.1.254 255.255.255.0
ip helper-address 10.1.3.50
no shutdown
exit

interface vlan 20
ip address 10.1.2.254 255.255.255.0
ip helper-address 10.1.3.50
no shutdown
exit

interface vlan 30
ip address 10.1.3.254 255.255.255.0
ip helper-address 10.1.3.50
no shutdown
exit

interface range fa0/0
ip address 10.1.0.6 255.255.255.252
no shutdown
exit

interface range fa1/0
switchport trunk encapsulation dot1q
switchport mode trunk
no cdp enable
exit

interface range fa1/1
switchport trunk encapsulation dot1q
switchport mode trunk
no cdp enable
exit

interface range fa1/2
switchport trunk encapsulation dot1q
switchport mode trunk
no cdp enable
exit

interface range fa1/3
switchport trunk encapsulation dot1q
switchport mode trunk
no cdp enable
exit

router ospf 1
router-id 1.1.1.1
network 10.1.1.0 0.0.0.255 area 0
network 10.1.2.0 0.0.0.255 area 0
network 10.1.3.0 0.0.0.255 area 0
network 10.1.0.4 0.0.0.3 area 0
passive-interface fa1/0
passive-interface fa1/1
passive-interface fa1/2
passive-interface fa1/3
exit

ip route 0.0.0.0 0.0.0.0 10.1.0.5

# Création users
username admin privilege 15 secret cisco
username helpdesk privilege 1 secret cisco

#Nome de domaine
ip domain-name  meditechbelgica.local

# Accès SSH sécurisé
line vty 0 15
login local
transport input ssh
exit
crypto key generate rsa
2048
ip ssh version 2

end

copy running-config startup-config
```


