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
no shutdown
exit

interface vlan 20
ip address 10.1.2.254 255.255.255.0
no shutdown
exit

interface vlan 30
ip address 10.1.3.254 255.255.255.0
no shutdown
exit

#configurations des interfaces physiques

interface range gigabitEthernet 1/0 - 3
switchport trunk encapsulation dot1q
switchport mode trunk
exit

end

copy running-config startup-config
```


