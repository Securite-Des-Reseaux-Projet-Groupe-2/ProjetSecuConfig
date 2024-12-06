```
en
conf t

hostname SL2-DMZ

vlan 100
name DMZ
exit

ip dhcp snooping  
ip dhcp snooping vlan 100  
ip arp inspection vlan 100  

no cdp run  

int range g1/1 - 2  
no cdp enable  
switchport port-security  
switchport port-security maximum 2  
switchport port-security violation restrict  
switchport port-security mac-address sticky  
no ip dhcp snooping trust  
no ip arp inspection trust  
ip dhcp snooping limit rate 5  
spanning-tree bpduguard enable  

int g1/0  
ip dhcp snooping trust  
ip arp inspection trust  

no shut  
exit   

#SSH  
ip domain-name meditechbelgica.local  

crypto key generate rsa  
#modulus 2048 après le prompt...  
2048  

ip ssh version 2  

line vty 0 4  
transport input ssh    
login local  
exit    

username admin privilege 15 secret cisco

username helpdesk privilege 1 secret cisco

end

copy run start
```
