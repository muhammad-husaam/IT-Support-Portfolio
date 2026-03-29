# Security Scan Report - Home Lab

**Author:** Muhammad Husaam  
**Date:** March 2026  
**Tool:** Nmap 7.95  
**Target:** Windows Server 2022 Domain Controller  

---

## Objective
Perform a network reconnaissance scan on a Windows Server 2022 Domain 
Controller in a controlled home lab environment to identify open ports 
and running services.

---

## Environment
- **Attacker Machine:** Kali Linux (192.168.164.129)
- **Target Machine:** Windows Server 2022 (192.168.164.132)
- **Network:** VMware NAT (isolated lab environment)
- **Domain:** lab.local

---

## Scans Performed

### Scan 1 — Basic Port Scan
```
nmap 192.168.164.132
```

### Scan 2 — Service Version Detection
```
nmap -sV 192.168.164.132
```

---

## Open Ports Discovered

| Port | State | Service | Version |
|------|-------|---------|---------|
| 53 | Open | DNS | Simple DNS Plus |
| 88 | Open | Kerberos | Microsoft Windows Kerberos |
| 135 | Open | MSRPC | Microsoft Windows RPC |
| 139 | Open | NetBIOS | Microsoft Windows NetBIOS |
| 389 | Open | LDAP | Microsoft AD LDAP (lab.local) |
| 445 | Open | SMB | Microsoft Directory Services |
| 636 | Open | LDAPS | Secure LDAP |
| 3268 | Open | LDAP | Global Catalog (lab.local) |
| 5985 | Open | HTTP | Microsoft HTTPAPI 2.0 |

---

## Findings

The scan confirmed the target is a **Windows Server 2022 Domain Controller**
for the **lab.local** domain. Key findings:

- **DNS (53)** — Domain Name resolution active
- **Kerberos (88)** — Active Directory authentication service running
- **LDAP (389/3268)** — Directory services exposed confirming AD DS role
- **SMB (445)** — File sharing enabled
- **NetBIOS (139)** — Legacy name resolution active

---

## Recommendations

- Disable **NetBIOS (139)** if not required — legacy protocol with 
known vulnerabilities
- Restrict **SMB (445)** access to trusted hosts only
- Ensure **LDAP (389)** is replaced with **LDAPS (636)** for encrypted 
directory queries
- Apply Windows Firewall rules to limit exposure of RPC ports

---

## Tools Used
- Kali Linux
- Nmap 7.95
- VMware Workstation

---

## Disclaimer
This scan was performed in an isolated lab environment on systems 
owned and controlled by the author for educational purposes only.