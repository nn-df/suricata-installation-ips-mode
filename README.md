## This guide for setting suricata in IPS mode with iptables

## Notes
- Test using Ubuntu LTS 20.04 and Suricata 6.0.4

## Requirements
- Internet connection
- Working suricata in IDS mode with NFQUEUE enable or can used this script for [Suricata installation](https://github.com/nn-df/suricata-installation "Suricata installation with single script")


## How to
```
git clone https://github.com/nn-df/suricata-installation-ips-mode.git
cd suricata-installation-ips-mode
cp custom.rules /etc/suricata/rules *depends on suricata rules installation folder
*edit suricata.yml to include custom.rules
sudo systemctl restart suricata
```
### Test suricata in IDS mode
```
ping -c 3 8.8.8.8
ping -c 3 1.1.1.1
cat /var/log/suricata/fast.log
```

### Configure suricata in IPS mode
```
1 - stop current suricata service if running
sudo systemctl stop suricata

2 - enable blocking rules in custom.rules (remove #comment)

3 - Running suricata in IPS mode
sudo suricata -c /etc/suricata/suricata.yaml -q 0 -v

4 - Executed iptables rules download from github
sudo bash suricata-iptable-rules.sh

5 - Monitor fast.log file
tail -f /var/log/suricata/fast.log

6 - Test the suricata rules
ping -c 3 8.8.8.8 <-- should alert only
ping -c 3 1.1.1.1 <-- should alert and blocking

```
