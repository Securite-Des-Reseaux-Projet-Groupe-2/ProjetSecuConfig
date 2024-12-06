```
configure terminal
!
!Création du VLAN
vlan 100
name DMZ
no shut
exit
!
!
!Interface VLAN avec adresse IP et HSRP
interface Vlan 100
ip address 10.100.0.254 255.255.255.0
no shut
!
!Configuration HSRP
standby version 2
standby 100 ip 10.100.0.1
standby 100 priority 100
standby 100 preempt
!
exit
interface range fastEthernet 0/0
no shut
exit
!
interface range fastEthernet 1/2 - 3
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit

interface Port-channel1
switchport trunk encapsulation dot1q
switchport mode trunk
no shut
exit
copy run start
```
