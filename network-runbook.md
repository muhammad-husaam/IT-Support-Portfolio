# Network Troubleshooting Runbook
**Author:** Muhammad Husaam  
**Last Updated:** 2026  

---

## 1. No Internet Connectivity

**Symptoms:** Cannot browse websites, ping fails

**Steps:**
1. Check physical cable or WiFi connection
2. Run `ipconfig` — check if IP address is assigned
3. Ping the default gateway `ping 192.168.1.1`
4. Ping Google DNS `ping 8.8.8.8`
5. Ping a domain `ping google.com`

**If ping 8.8.8.8 works but ping google.com fails — DNS issue**  
**If ping gateway fails — local network issue**  
**If all pings fail — check NIC or router**

---

## 2. DNS Issues

**Symptoms:** Websites don't load but internet works

**Steps:**
1. Run `nslookup google.com`
2. Check DNS server `ipconfig /all`
3. Flush DNS cache `ipconfig /flushdns`
4. Change DNS to Google `8.8.8.8` or Cloudflare `1.1.1.1`

---

## 3. IP Address Issues

**Symptoms:** No IP assigned, or 169.254.x.x address showing

**Steps:**
1. Run `ipconfig /release`
2. Run `ipconfig /renew`
3. Check DHCP server is running
4. Assign static IP manually if needed

---

## 4. Slow Network / Packet Loss

**Symptoms:** Slow browsing, video buffering, high latency

**Steps:**
1. Run `ping 8.8.8.8 -t` — check for packet loss
2. Run `tracert google.com` — find where delay occurs
3. Check for bandwidth heavy applications
4. Restart router and modem

---

## 5. Key Commands Reference

| Command | Purpose |
|---|---|
| `ipconfig` | Show IP configuration |
| `ipconfig /all` | Show detailed network info |
| `ipconfig /flushdns` | Clear DNS cache |
| `ipconfig /release` | Release IP address |
| `ipconfig /renew` | Renew IP address |
| `ping` | Test connectivity |
| `tracert` | Trace network path |
| `nslookup` | DNS lookup |
| `netstat` | Show active connections |
| `netsh wlan show profiles` | Show saved WiFi networks |

---

## 6. General Troubleshooting Approach

Always follow this order:
1. Physical layer first — cables, WiFi, NIC
2. IP layer — ipconfig, ping gateway
3. Internet layer — ping 8.8.8.8
4. DNS layer — ping google.com, nslookup
5. Application layer — browser, firewall, proxy