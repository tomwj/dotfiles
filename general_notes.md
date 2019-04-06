# Networking
## Test for DHCP servers
`sudo nmap --script broadcast-dhcp-discover`

## Scan addresses
### Fast
`sudo nmap -F 192.168.0.1/24`

# Fault fixes
## Icon not displaying in Slack
Add line `StartupWMClass=Slack` to
```
/var/lib/snapd/desktop/applications/slack_slack.desktop
```

