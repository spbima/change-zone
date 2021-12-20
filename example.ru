$TTL 14400

example.ru.    IN      SOA     ns5.example.ru. admin.example.ru. (
        2021112502      ; Serial
        10800           ; Refresh
        3600            ; Retry
        604800          ; Expire
        300             ; Negative Response TTL
)

                IN      NS      ns5.example.ru.
                IN      NS      ns6.example.ru.

;                IN      MX 20   relay.example.ru.
                IN      MX 10   relay-new2.example.ru.

@               IN      A       192.168.107.106
*.blocked       IN      A       192.168.108.105
*               IN      A       192.168.107.106
;bi             IN      A       192.168.108.109
blocked         IN      A       192.168.108.105
;egemon         IN      A       192.168.108.106
ftp             IN      A       192.168.107.83
mx1.vh          IN      A       192.168.108.97
mikro-1         IN      A       10.104.63.130
mikro60130      IN      A       10.104.60.130
mikro60131      IN      A       10.104.60.131
mikro60132      IN      A       10.104.60.132
cp              IN      A       192.168.107.106
lko             IN      A       192.168.107.106
bi              IN      A       192.168.107.106
bi-reserve      IN      A       192.168.107.106
collabora       IN      A       192.168.107.105
ns1             IN      A       192.168.107.97
ns2             IN      A       192.168.107.98
ns3             IN      A       192.168.108.199
ns5             IN      A       192.168.107.122
ns6             IN      A       192.168.107.123
autodiscover    IN      A       192.168.107.84
stoutlook       IN      A       192.168.107.84
omoutlook       IN      A       192.168.107.84
nroutlook       IN      A       192.168.107.84
sdoutlook       IN      A       192.168.107.84
cas             IN      A       192.168.107.84
oss             IN      A       192.168.107.106
phpmyadmin      IN      A       192.168.107.100
phpmyadmin2     IN      A       192.168.108.100
phpmyadmin3     IN      A       192.168.107.86
;projects       IN      A       192.168.108.99
projects        IN      A       192.168.107.106
relay-new       IN      A       192.168.108.108
relay-new2      IN      A       192.168.107.107
relay           IN      A       192.168.108.108
relay1          IN      A       192.168.107.103
relay9          IN      A       192.168.108.101
stoutlook       IN      A       192.168.107.84
vh              IN      A       192.168.107.100
vh1             IN      A       192.168.107.100
vh2             IN      A       192.168.108.100
vh3             IN      A       192.168.107.86
egez            IN      A       192.168.107.85
fastmon         IN      A       192.168.107.85
auth            IN      A       192.168.107.126
pk              IN      A       192.168.107.101
voipstat-admin  IN      A       192.168.107.101
huawei-1        IN      A       10.102.0.4
huawei-2        IN      A       10.102.0.2
bt-hw-05        IN      A       10.100.17.2
ege2018         IN      A       192.168.107.121
viros2018       IN      A       192.168.107.85
vyros2018       IN      A       192.168.107.85
vpn112          IN      A       192.168.108.74
call-flow       IN      A       109.195.81.57
vservice        IN      A       192.168.107.103
zakupki         IN      A       185.179.85.61
vpn             IN      A
vpn             IN      A       192.168.108.107
vpn             IN      A       192.168.108.195
vpn             IN      A       192.168.108.196
vpn             IN      A       192.168.108.197
vmx1            IN      A       192.168.108.198
imap            IN      A       192.168.108.198
pop             IN      A       192.168.108.198
smtp            IN      A       192.168.108.198
tetra           IN      A       192.168.32.28
roundcube       IN      A       192.168.108.198
roundcube-stab  IN      A       192.168.108.198
postadmin       IN      A       192.168.108.198
webmaillite     IN      A       192.168.108.198
mailclients     IN      A       192.168.108.198
sbc             IN      A       192.168.32.21
vks             IN      A       192.168.108.229
vcs             IN      A       192.168.108.229
rc              IN      A       192.168.32.18
videomost       IN      A       192.168.32.26
news            IN      A       192.168.107.106
*.new           IN      A       95.167.187.13
bi-reserve      IN      A       192.168.107.106
mail            IN      A       95.167.187.8
new             IN      A       95.167.187.13
old             IN      A       212.119.174.131
owa             IN      A       192.168.108.108
ownc            IN      A       192.168.107.84
;projects        IN      A       192.168.173.8
vh03            IN      A       192.168.107.86
vh4             IN      A       192.168.108.227
z               IN      A       77.232.80.240
;stoutlook       IN      A       192.168.173.4
;omoutlook       IN      A       192.168.173.6
;autodiscover    IN      A       192.168.173.4
tbf             IN      A       192.168.164.29
pk              IN      A       192.168.107.101
voipstat-admin  IN      A       192.168.107.101
sharing         IN      A       192.168.107.94
doc             IN      A       192.168.107.82

unused          IN      A       192.168.108.1
unused          IN      A       192.168.108.2
unused          IN      A       192.168.108.3


www.bi-reserve  IN      CNAME   bi-reserve
www.bi          IN      CNAME   bi

www             IN      CNAME   example.ru.
www.ownc        IN      CNAME   ownc.spb.ru.

@               IN      TXT     "v=spf1 +mx ip4:192.168.107.107 -all"
vh              IN      TXT     "v=spf1 +mx ip4:192.168.108.97 -all"

default._domainkey      IN      TXT     "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCWbT9Xn6qYgTfxg0zPXhZ4jL0Mw09ZR1KnQEVvuEXk20H0AbYTv+ywsZPAcykilUm1XXTRBES8MlMjIIxJXt1/8nrSZ4YTQREYPiMDAYrSntGwMdgLmn+XOLUYyCSJOQ56PFw4NYh0Y8Q4HXBuIDhnn2l+J/h5yM/plnkb/TVJUwIDAQAB"

_dmarc          IN      TXT     "v=DMARC1; p=quarantine; sp=none; pct=100; fo=0; rua=mailto:postmaster@example.ru"
