# DHCP Server Setup - Windows Server 2022

**Author:** Muhammad Husaam  
**Date:** March 2026  
**Server:** WIN-TGLP51L0VPP  
**Domain:** lab.local  

---

## Overview
Configured a DHCP Server on Windows Server 2022 to automatically 
assign IP addresses to client machines on the lab.local network.

---

## DHCP Scope Configuration

| Setting | Value |
|---------|-------|
| Scope Name | Lab Network Scope |
| Start IP | 192.168.164.100 |
| End IP | 192.168.164.200 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.164.2 |
| DNS Server | 192.168.164.132 |
| Lease Duration | 8 Days |
| Status | Active |

---

## Screenshots
![DHCP Manager](dhcp-manager.png)
![DHCP Scope](dhcp-scope.png)

---

## Skills Demonstrated
- DHCP Server installation and configuration
- IP scope creation and activation
- Network services management on Windows Server 2022