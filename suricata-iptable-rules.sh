# if your suricata running as gateway
sudo iptables -I FORWARD -j NFQUEUE

# rules for host layer only
sudo iptables -I INPUT -j NFQUEUE
sudo iptables -I OUTPUT -j NFQUEUE
