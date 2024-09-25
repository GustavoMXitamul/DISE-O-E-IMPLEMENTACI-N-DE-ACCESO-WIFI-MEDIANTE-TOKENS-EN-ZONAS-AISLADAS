# 2024-09-24 20:08:39 by RouterOS 7.13.4
# software id = Y14M-83BN
#
# model = RB5009UPr+S+
# serial number = HDE08CMK5K7
/caps-man configuration
add channel.band=5ghz-n/ac .control-channel-width=20mhz .extension-channel=XX \
    .frequency=5805 country=guatemala hw-protection-mode=rts-cts \
    installation=outdoor mode=ap name=Residencial5G \
    security.authentication-types=wpa-psk,wpa2-psk ssid=StarNetResidencial
/interface bridge
add name=bridge-Adm vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment=MantBox
set [ find default-name=ether2 ] comment=Starlink
set [ find default-name=ether3 ] comment=Fibra poe-out=off
set [ find default-name=ether4 ] poe-out=off
set [ find default-name=ether5 ] comment="Sectorial 4"
set [ find default-name=ether6 ] comment="Sectorial 1"
set [ find default-name=ether7 ] comment="Antena TP Link" poe-out=forced-on
set [ find default-name=ether8 ] poe-out=off
set [ find default-name=sfp-sfpplus1 ] disabled=yes
/interface ovpn-client
add cipher=aes256-cbc connect-to=104.248.5.108 mac-address=FE:5B:42:C2:69:8F \
    name=vpnmikrowisp user=ckofhvfbibav
/interface wireguard
add listen-port=13231 mtu=1420 name=wg0
/interface vlan
add interface=bridge-Adm name=VlanHostpot vlan-id=13
add interface=bridge-Adm loop-protect=on name=VlanWisp vlan-id=10
add interface=bridge-Adm name=vlanADM vlan-id=100
/interface list
add comment="Interfaces por las que entra el Internet" name=WAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=kingonetworks.com hotspot-address=192.168.10.10 \
    http-cookie-lifetime=10m login-by=cookie,https,mac-cookie name=hsprof1 \
    ssl-certificate=certificate.crt_0
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=no
add !keepalive-timeout mac-cookie-timeout=1h name=1hora on-login="#Automatic w\
    irenexfree time;\r\
    \n:global getuser \$user;\r\
    \n:local usertask do={\r\
    \n:local runscrt;\r\
    \n:local script [/system script get [find name=taskrun] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com" session-timeout=1h
add keepalive-timeout=1d name=Tcorrido on-login="#Automatic wirenexfree time;\
    \r\
    \n:global getuser \$user;\r\
    \n:local usertask do={\r\
    \n:local runscrt;\r\
    \n:local script [/system script get [find name=taskrun] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com"
add name=Tpausado on-login="#inserte dias para crear la regla (1-30);\r\
    \n:global dias 3;\r\
    \n:global getuser \$user;\r\
    \n:local usertask do={ :local runscrt;\r\
    \n:local script [/system script get [find name=taskpaused] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com"
add !keepalive-timeout mac-cookie-timeout=1d name=1D on-login="#Automatic wire\
    nexfree time;\r\
    \n:global getuser \$user;\r\
    \n:local usertask do={\r\
    \n:local runscrt;\r\
    \n:local script [/system script get [find name=taskrun] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com" session-timeout=1d
add !keepalive-timeout name=3D on-login="#Automatic wirenexfree time;\r\
    \n:global getuser \$user;\r\
    \n:local usertask do={\r\
    \n:local runscrt;\r\
    \n:local script [/system script get [find name=taskrun] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com" session-timeout=3d
add !keepalive-timeout mac-cookie-timeout=1w name=7D on-login="#Automatic wire\
    nexfree time;\r\
    \n:global getuser \$user;\r\
    \n:local usertask do={\r\
    \n:local runscrt;\r\
    \n:local script [/system script get [find name=taskrun] source]; \r\
    \n:for i from=([:len \$script] - 1) to=0 do={ :set runscrt (\$runscrt . [:\
    pick \$script \$i]);} \r\
    \n:return \$runscrt;}\r\
    \n[parse \"\$[\$usertask]\"];\r\
    \n#Support: http://diegobigwor.blogspot.com" session-timeout=1w
/ip pool
add comment=Wisp name=dhcp_pool1 ranges=192.168.13.10-192.168.13.254
add comment=Hotspot name=dhcp_pool4 ranges=192.168.10.20-192.168.10.254
add comment=Admin name=dhcp_pool6 ranges=172.16.0.2-172.16.0.254
/ip dhcp-server
add address-pool=dhcp_pool1 interface=VlanWisp name=dhcp1
add address-pool=dhcp_pool4 interface=VlanHostpot name=dhcp4
add address-pool=dhcp_pool6 interface=vlanADM lease-time=1h name=dhcp2
/ip hotspot
add address-pool=dhcp_pool4 addresses-per-mac=1 disabled=no interface=\
    VlanHostpot name=hotspot1 profile=hsprof1
/queue tree
add name=Mkws_DOWN parent=global
add name=Mkws_UP parent=global
/queue type
add kind=pcq name=MkwspPCQ_1-down pcq-burst-rate=6500k pcq-burst-threshold=4M \
    pcq-burst-time=15s pcq-classifier=dst-address pcq-rate=5M
add kind=pcq name=MkwspPCQ_1-up pcq-burst-rate=1300k pcq-burst-threshold=800k \
    pcq-burst-time=15s pcq-classifier=src-address pcq-rate=1M
add kind=pcq name=MkwspPCQ_4-up pcq-burst-rate=600k pcq-burst-threshold=300k \
    pcq-classifier=src-address pcq-rate=500k
add kind=pcq name=MkwspPCQ_4-down pcq-burst-rate=3600k pcq-burst-threshold=\
    1800k pcq-classifier=dst-address pcq-rate=3M
/queue tree
add name=Mkwsp_1-DOWN packet-mark=MkwspMark_1-in parent=Mkws_DOWN priority=3 \
    queue=MkwspPCQ_1-down
add name=Mkwsp_1-UP packet-mark=MkwspMark_1-out parent=Mkws_UP priority=3 \
    queue=MkwspPCQ_1-up
add name=Mkwsp_4-DOWN packet-mark=MkwspMark_4-in parent=Mkws_DOWN priority=7 \
    queue=MkwspPCQ_4-down
add name=Mkwsp_4-UP packet-mark=MkwspMark_4-out parent=Mkws_UP priority=7 \
    queue=MkwspPCQ_4-up
add name=Bajada-Whatsapp packet-mark=Whastapp-Paquetes parent=Mkws_DOWN \
    priority=1 queue=pcq-download-default
add name=Subida-Whatsapp packet-mark=Whastapp-Paquetes parent=Mkws_UP \
    priority=1 queue=pcq-upload-default
/routing table
add disabled=no fib name=Hueveo
/system logging action
set 1 disk-file-name=log
add disk-file-name=wrscript name=userprofile target=disk
/caps-man manager
set enabled=yes
/interface bridge port
add bridge=bridge-Adm interface=ether5
add bridge=bridge-Adm interface=ether6
add bridge=bridge-Adm interface=ether7
add bridge=bridge-Adm interface=ether8
add bridge=bridge-Adm interface=ether4
/interface bridge vlan
add bridge=bridge-Adm tagged=bridge-Adm,ether5,ether6,ether8,ether7,ether4 \
    vlan-ids=10,13,100,1
/interface list member
add interface=ether1 list=WAN
add interface=ether2 list=WAN
add interface=ether3 list=WAN
/interface wireguard peers
add allowed-address=1.0.0.0/16 endpoint-address=104.248.5.108 endpoint-port=\
    51820 interface=wg0 persistent-keepalive=25s public-key=\
    "VEH7Kxj3E8xldgHc6MzwsqWIiecU6w1PIagobl/jLB8="
/ip address
add address=1.0.0.23/16 interface=wg0 network=1.0.0.0
add address=192.168.13.1/24 interface=VlanWisp network=192.168.13.0
add address=192.168.10.1/24 interface=VlanHostpot network=192.168.10.0
add address=172.16.0.1/24 interface=vlanADM network=172.16.0.0
/ip dhcp-client
add default-route-distance=2 interface=ether1
add interface=ether2
add default-route-distance=3 interface=ether3
/ip dhcp-server lease
add address=192.180.0.245 comment="Marlyn Ram\EDrez" mac-address=\
    18:FD:74:C9:A9:B7
add address=192.168.13.10 comment="Jaqueline Cruz" mac-address=\
    78:9A:18:F5:EB:8A
add address=192.168.13.12 comment="Arturo Cruz (Sectoriales)" mac-address=\
    18:FD:74:C9:A9:9D
add address=192.168.13.13 comment="Escuela aldea La Piragua Profe H\E9ctor" \
    mac-address=48:A9:8A:06:0C:6C
add address=192.168.13.11 comment="Francisco L\F3pez (otra tienda)" \
    mac-address=48:A9:8A:06:0D:78
add address=192.168.13.14 comment="Jos\E9 Batres" mac-address=\
    18:FD:74:C9:A9:B1
add address=192.168.13.15 comment="Adela Larios (Campo)" mac-address=\
    18:FD:74:C9:A9:97
add address=192.168.13.17 comment="Paulo Efra\EDn (Frente Escuela)" \
    mac-address=18:FD:74:C9:A9:A7
add address=192.168.13.16 comment="Casa 5 Frente a tienda" mac-address=\
    48:A9:8A:06:0D:F7
add address=192.168.13.18 comment="Cableado 1" mac-address=D4:01:C3:05:F8:CE
add address=192.168.13.19 comment="Casa Tienda" mac-address=78:9A:18:81:BB:DE
add address=192.168.13.20 comment="Mar\EDa Teresa L\F3pez" mac-address=\
    18:FD:74:C9:A9:BB
add address=192.168.13.21 comment="Carlos Garc\EDa" mac-address=\
    78:9A:18:F5:EA:5A
/ip dhcp-server network
add address=172.16.0.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=172.16.0.1
add address=192.168.10.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=192.168.10.1
add address=192.168.13.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=192.168.13.1
/ip dns
set allow-remote-requests=yes
/ip firewall address-list
add address=192.168.13.14 comment=List_pcq_5 list=Mkws_PCQ_1
add address=192.168.13.16 comment=List_pcq_6 list=Mkws_PCQ_1
add address=192.168.13.15 comment=List_pcq_7 list=Mkws_PCQ_1
add address=192.168.13.17 comment=List_pcq_8 list=Mkws_PCQ_1
add address=192.168.13.13 comment=List_pcq_9 list=Mkws_PCQ_1
add address=192.168.13.20 comment=List_pcq_10 list=Mkws_PCQ_1
add address=192.180.0.245 comment=List_pcq_11 list=Mkws_PCQ_1
add address=192.168.13.12 comment=List_pcq_12 list=Mkws_PCQ_1
add address=192.168.13.10 comment=List_pcq_15 list=Mkws_PCQ_1
add address=192.168.13.18 comment=List_pcq_24 list=Mkws_PCQ_1
add address=192.168.13.19 comment=List_pcq_25 list=Mkws_PCQ_1
add address=192.168.13.11 comment=List_pcq_3 list=Mkws_PCQ_1
add address=192.168.13.11 comment=Corte_Servicio_3 list=morosos
add address=192.180.0.245 comment=Corte_Servicio_11 list=morosos
add address=192.168.13.21 comment=List_pcq_14 list=Mkws_PCQ_1
add address=192.168.13.14 comment=Corte_Servicio_5 list=morosos
add address=192.168.13.17 comment=Corte_Servicio_8 list=morosos
/ip firewall filter
add action=drop chain=input disabled=yes log=yes src-address=192.168.5.0/24
add action=accept chain=forward comment="Mikrowisp - Acceso portal" \
    dst-address=104.248.5.108
add action=accept chain=forward comment="Mikrowisp - Permitir DNS aviso" \
    dst-port=53 protocol=udp src-address-list=morosos
add action=drop chain=forward comment="Mikrowisp - Bloquear todo morosos" \
    dst-address-list=!ips_permitidas_morosos src-address-list=morosos
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward comment="Tr\E1fico Whatsapp" \
    content=wa.me src-address=192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsappbrand.com \
    src-address=192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsapp.cc src-address=\
    192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsapp.com src-address=\
    192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsapp.org src-address=\
    192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsapp.info src-address=\
    192.180.0.0/24
add action=add-dst-to-address-list address-list=Whatsapp \
    address-list-timeout=4d chain=forward content=whatsapp.net src-address=\
    192.180.0.0/24
add action=accept chain=input dst-port=80 protocol=tcp
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall mangle
add action=change-ttl chain=prerouting in-interface-list=WAN new-ttl=set:64 \
    passthrough=no
add action=mark-connection chain=prerouting comment=Whatsapp-Starnet \
    dst-address-list=Whatsapp new-connection-mark=Whatsapp-Starnet \
    passthrough=yes src-address=192.180.0.0/24
add action=mark-packet chain=prerouting comment=Whatsapp-Starnet \
    connection-mark=Whatsapp-Starnet new-packet-mark=Whastapp-Paquetes \
    passthrough=no src-address=192.180.0.0/24
add action=mark-routing chain=prerouting comment=Extra new-routing-mark=\
    Hueveo passthrough=no src-address=192.180.0.0/24
add action=mark-packet chain=postrouting comment=Mkwsp_1-in dst-address-list=\
    Mkws_PCQ_1 new-packet-mark=MkwspMark_1-in passthrough=no
add action=mark-packet chain=forward comment=Mkwsp_1-out new-packet-mark=\
    MkwspMark_1-out passthrough=no src-address-list=Mkws_PCQ_1
add action=mark-packet chain=postrouting comment=Mkwsp_4-in dst-address-list=\
    Mkws_PCQ_4 new-packet-mark=MkwspMark_4-in passthrough=no
add action=mark-packet chain=forward comment=Mkwsp_4-out new-packet-mark=\
    MkwspMark_4-out passthrough=no src-address-list=Mkws_PCQ_4
/ip firewall nat
add chain=dstnat comment="Mikrowisp - Permitir Avisos" dst-address=\
    104.248.5.108
add action=redirect chain=dstnat comment="Mikrowisp - Aviso Morosos" \
    dst-address-list=!ips_permitidas_morosos dst-port=80 protocol=tcp \
    src-address-list=morosos to-ports=999
add action=redirect chain=dstnat comment="Mikrowisp - Bloquear todo" \
    dst-address-list=!ips_permitidas_morosos src-address-list=morosos
add action=redirect chain=dstnat comment="Mikrowisp - Aviso en pantalla" \
    dst-port=80 protocol=tcp src-address-list=aviso to-ports=999
add action=masquerade chain=srcnat out-interface=ether1
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat src-address=192.168.10.0/24
add action=masquerade chain=srcnat out-interface-list=WAN
/ip hotspot user
add name=SuperStar
add name=SuperStar2
add name=tienda
add limit-uptime=1d name=31695727 profile=1D
add limit-uptime=1d name=30593039 profile=1D
/ip proxy
set enabled=yes port=999
/ip proxy access
add action=redirect action-data=\
    "104.248.5.108/avisos/\?id=djBxTmNWc0FsK0lJUXZCeU41TEdIUT09&tipo=corte" \
    comment=Corte_Servicio_3 src-address=192.168.13.11
add action=redirect action-data=\
    "104.248.5.108/avisos/\?id=dTBMT2E5ZTVKZWxJdlo0dnZ4L2FxZz09&tipo=corte" \
    comment=Corte_Servicio_11 src-address=192.180.0.245
add action=redirect action-data=\
    "104.248.5.108/avisos/\?id=ZXFZRitBWnpVZXVXZU9VWk5LYVU4dz09&tipo=corte" \
    comment=Corte_Servicio_5 src-address=192.168.13.14
add action=redirect action-data=\
    "104.248.5.108/avisos/\?id=aTQrNktJMWVJNTgvZDFtOUFMODEzZz09&tipo=corte" \
    comment=Corte_Servicio_8 src-address=192.168.13.17
/ip service
set www-ssl certificate=certificate.crt_0 disabled=no
/ip traffic-flow
set enabled=yes
/ip traffic-flow target
add dst-address=10.8.0.1 port=9996 src-address=10.8.0.6 version=5
/ipv6 dhcp-client
add add-default-route=yes disabled=yes interface=ether2 pool-name=\
    WAN-STARLINK pool-prefix-length=62 request=prefix
/ipv6 firewall filter
add action=drop chain=forward comment="Mikrowisp - Bloquear todo morosos" \
    dst-address-list=!ips_permitidas_morosos src-address-list=morosos
/ipv6 nd
set [ find default=yes ] other-configuration=yes
/system clock
set time-zone-autodetect=no time-zone-name=America/Guatemala
/system identity
set name=StarNet23
/system logging
add action=disk topics=error
/system note
set show-at-login=no
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.north-america.pool.ntp.org
add address=1.north-america.pool.ntp.org
/system scheduler
add disabled=yes interval=3m name=ReleaseScheduler on-event=ReleaseDHCP \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=yes name=ReleaseDHCP owner=SuperKingo policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global pingCount [/ping count=4 address=8.8.8.8]\r\
    \n:if (\$pingCount = 0) do={\r\
    \n    /ip dhcp-client release [find interface=ether2]\r\
    \n    :log error \"Error de DHCP Starlink\"\r\
    \n}\r\
    \n"
add dont-require-permissions=no name=taskrun owner=SuperKingo policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="}\
    }}}};Hamus\$=emit-trats \"etaDtamrof\$\"=etad-trats \";\"\\.emit tehsinif \
    ,)oirausu\$( deteleD\"\\ ofni gol:n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[  evomer reludehcs metsys/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[ evomer resu topstoh pi/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=resu erehw dnif[ evomer evitca topstoh pi/n\\\
    \n\r\\r\\:eerfxeneriw-citamotua oirausu\$ raelC#\"=tneve-no \"etaDtamrof\$\
    \_Hamus\$ :evomer yad )kimahcef\$ kimaroh\$( noitartsigeR\"=tnemmoc \"oira\
    usu\$\"=eman \"00:50:00\"=lavretni dda reludehcs metsys/\
    \n\r;\"etaDtamrof\$ Hamus\$ :eripxe yad ,)oirausu\$( reludehcs noitartsige\
    R\"  ofni gol:\
    \n\r{=od )0 =< ]]oirausu\$=eman dnif reludehcs metsys/[ nel:[( fi:\
    \n\r{=od )0 > ]]]eliforpresu=eman dnif[ teg noitca gniggol metsys/[ nel:[(\
    \_fi:\
    \n\r};\"raey\$/ecnevaid\$/htnom\$\" etaDtamrof tes:{=esle }\
    \n\r;\"ecnevaid\$-htnom\$-raey\$\" etaDtamrof tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;etaDtamrof lacol:\
    \n\r}}};)1 + raey\$( raey tes:\
    \n\r ;)\"naj\"( htnom tes:\
    \n\r{=od )\"ced\"= htnom\$( fi:\
    \n\r};)1 + raey\$( raey tes:\
    \n\r ;)\"10\"( htnom tes:\
    \n\r{=od )\"21\"= htnom\$( fi:\
    \n\r};)\"von\"( htnom tes:{=od )\"tco\"= htnom\$( fi:\
    \n\r};)\"gua\"( htnom tes:{=od )\"luj\"= htnom\$( fi:\
    \n\r};)\"pes\"( htnom tes:{=od )\"gua\"= htnom\$( fi:\
    \n\r};)\"nuj\"( htnom tes:{=od )\"yam\"= htnom\$( fi:\
    \n\r};)\"rpa\"( htnom tes:{=od )\"ram\"= htnom\$( fi:\
    \n\r};)\"bef\"( htnom tes:{=od )\"naj\"= htnom\$( fi:\
    \n\r};)\"11\"( htnom tes:{=od )\"01\"= htnom\$( fi:\
    \n\r};)\"80\"( htnom tes:{=od )\"70\"= htnom\$( fi:\
    \n\r};)\"90\"( htnom tes:{=od )\"80\"= htnom\$( fi:\
    \n\r};)\"60\"( htnom tes:{=od )\"50\"= htnom\$( fi:\
    \n\r};)\"40\"( htnom tes:{=od )\"30\"= htnom\$( fi:\
    \n\r};)\"20\"( htnom tes:{=od )\"10\"= htnom\$( fi:\
    \n\r;)13 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )13 > ecnevaid\$( fi:\
    \n\r{=od )\"ced\"=htnom\$ ro \"tco\"=htnom\$ ro \"gua\"=htnom\$ ro \"luj\"\
    =htnom\$ ro \"yam\"=htnom\$ ro \"ram\"=htnom\$ ro \"naj\"=htnom\$ ro \"21\
    \"=htnom\$ ro \"01\"=htnom\$ ro \"80\"=htnom\$ ro \"70\"=htnom\$ ro \"50\"\
    =htnom\$ ro \"30\"=htnom\$ ro \"10\"=htnom\$( fi:\
    \n\r}}};)\"tco\"( htnom tes:{=od )\"pes\"= htnom\$( fi:\
    \n\r};)\"luj\"( htnom tes:{=od )\"nuj\"= htnom\$( fi:\
    \n\r};)\"yam\"( htnom tes:{=od )\"rpa\"= htnom\$( fi:\
    \n\r};)\"ced\"( htnom tes:{=od )\"von\"= htnom\$( fi:\
    \n\r};)\"01\"( htnom tes:{=od )\"90\"= htnom\$( fi:\
    \n\r};)\"70\"( htnom tes:{=od )\"60\"= htnom\$( fi:\
    \n\r};)\"50\"( htnom tes:{=od )\"40\"= htnom\$( fi:\
    \n\r};)\"21\"( htnom tes:{=od )\"11\"= htnom\$( fi:\
    \n\r;)03 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )03 > ecnevaid\$( fi:\
    \n\r{=od )\"von\"=htnom\$ ro \"pes\"=htnom\$ ro \"nuj\"=htnom\$ ro \"rpa\"\
    =htnom\$ ro \"11\"=htnom\$ ro \"90\"=htnom\$ ro \"60\"=htnom\$ ro \"40\"=h\
    tnom\$( fi:\
    \n\r}}}};)\"ram\"( htnom tes:\
    \n\r{=esle }\
    \n\r;)\"30\"( htnom tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;)82 - ecnevaid\$(  ecnevaid tes:\
    \n\r{=od )82 > ecnevaid\$( fi:\
    \n\r{=esle }\
    \n\r}};)\"ram\"( htnom tes:\
    \n\r{=esle }\
    \n\r;)\"30\"( htnom tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;)92 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )92 > ecnevaid\$( fi:\
    \n\r{=od )0=4%raey\$( fi:\
    \n\r{=od )\"bef\"=htnom\$ ro \"20\"=htnom\$( fi:\
    \n\r}};)kimaroh\$( Hamus tes:\
    \n\r{=esle }\
    \n\r;)]21 4 Hamus\$ kcip:[( Hamus tes:\
    \n\r {=od )21 = ]Hamus\$ nel:[( fi:\
    \n\r{=esle }\
    \n\r;)]01 2 Hamus\$ kcip:[( Hamus tes:\
    \n\r {=od )01 = ]Hamus\$ nel:[( fi:\
    \n\r;)saidsam\$+yad\$( ecnevaid tes:\
    \n\r;))eeWT\$ * 7( + )yaDT\$ * 1(( saidsam lacol:\
    \n\r} ]nelsanames\$ 0 emitx\$ kcip:[ eeWT tes:{=od )\"mun\" = ]nelsanames\
    \$ foepyt:[(  fi:\
    \n\r} ]nelsaid\$ )1 + nelsanames\$( emitx\$ kcip:[ yaDT tes:{=od ))\"mun\"\
    \_= ]nelsaid\$ foepyt:[( dna )\"mun\" = ]nelsanames\$ foepyt:[(( fi:\
    \n\r}]nelsaid\$ 0 emitx\$ kcip:[ yaDT tes:{=od ))\"mun\" = ]nelsaid\$ foep\
    yt:[( dna )\"lin\" = ]nelsanames\$ foepyt:[(( fi:\
    \n\r0  eeWT lacol:\
    \n\r0  yaDT lacol:\
    \n\r ;]1- \"w\" emitx\$ dnif:[ nelsanames lacol:\
    \n\r ;]1- \"d\" emitx\$ dnif:[   nelsaid lacol:\
    \n\r;Hamus\$ emitx lacol:\
    \n\r{=esle }\
    \n\r}};Hamus\$=emit-trats \"etaDtamrof\$\"=etad-trats \";\"\\.emit tehsini\
    f ,)oirausu\$( deteleD\"\\ ofni gol:n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[  evomer reludehcs metsys/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[ evomer resu topstoh pi/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=resu erehw dnif[ evomer evitca topstoh pi/n\\\
    \n\r\\r\\:eerfxeneriw-citamotua oirausu\$ raelC#\"=tneve-no \"etaDtamrof\$\
    \_Hamus\$ :evomer remit )kimahcef\$ kimaroh\$( noitartsigeR\"=tnemmoc \"oi\
    rausu\$\"=eman \"00:50:00\"=lavretni dda\
    \n\r reludehcs metsys/\
    \n\r;\"etaDtamrof\$ Hamus\$ :eripxe remit ,)oirausu\$( reludehcs noitartsi\
    geR\"  ofni gol:\
    \n\r{=od )0 =< ]]oirausu\$=eman dnif reludehcs metsys/[ nel:[( fi:\
    \n\r{=od )0 > ]]]eliforpresu=eman dnif[ teg noitca gniggol metsys/[ nel:[(\
    \_fi:\
    \n\r};\"raey\$/yad\$/htnom\$\" etaDtamrof tes:\
    \n\r{=esle }\
    \n\r;\"yad\$-htnom\$-raey\$\" etaDtamrof tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;etaDtamrof lacol:\
    \n\r {=od )8 = ]Hamus\$ nel:[( fi:\
    \n\r;)opmeit\$ + kimaroh\$( Hamus lacol:\
    \n\r{=od ))21 =< gneLopmeit\$( && )8 => gneLopmeit\$(( fi:\
    \n\r{=od )\"00:00:00\" =! opmeit\$( fi:\
    \n\r};eurt 7noisrev tes:\
    \n\r;]01 8 kimahcef\$ kcip: [ yad tes:\
    \n\r;] 7 5 kimahcef\$ kcip: [ htnom tes:\
    \n\r;] 4 0 kimahcef\$ kcip: [ raey tes:\
    \n\r{=esle }\
    \n\r;eslaf 7noisrev tes:\
    \n\r;] 6 4 kimahcef\$ kcip: [ yad tes:\
    \n\r;] 3 0 kimahcef\$ kcip: [ htnom tes:\
    \n\r;] 11 7 kimahcef\$ kcip: [ raey tes:\
    \n\r {=od ) 01.7 < rolav\$( fi:\
    \n\r;7noisrev lacol:\
    \n\r;]4 0 noisrev\$ kcip:[ rolav lacol:\
    \n\r;]]noisrev=eman-eulav teg ecruoser metsys/[ rtsot:[=eulav noisrev laco\
    l:\
    \n\r;]opmeit\$ nel:[ gneLopmeit lacol:\
    \n\r ;]emitpu-timil ]oirausu\$=eman dnif[ teg resu topstoh pi/[ opmeit lac\
    ol:\
    \n\r;resuteg\$ oirausu lacol:\
    \n\r;ecnevaid lacol:\
    \n\r;yad lacol:\
    \n\r;htnom lacol:\
    \n\r;raey lacol:\
    \n\r;]etad teg kcolc metsys/[ kimahcef lacol:\
    \n\r;]emit teg kcolc metsys/[ kimaroh lacol:\
    \n\r;resuteg labolg:"
add dont-require-permissions=no name=taskpaused owner=SuperKingo policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="}\
    }};kimaroh\$=emit-trats \"etaDtamrof\$\"=etad-trats \";\"\\.odabaca aid us\
    \_ed omusnoc ,)oirausu\$( odanimile oirausU\"\\ ofni gol:n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[  evomer reludehcs metsys/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=eman erehw dnif[ evomer resu topstoh pi/n\\\
    \n\r\\r\\;]\"\\oirausu\$\"\\=resu erehw dnif[ evomer evitca topstoh pi/n\\\
    \n\r\\r\\:eerfxeneriw-citamotua oirausu\$ raelC#\"=tneve-no \"etaDtamrof\$\
    \_kimaroh\$ :evomer yad )kimahcef\$ kimaroh\$( noitartsigeR\"=tnemmoc \"oi\
    rausu\$\"=eman \"00:50:00\"=lavretni dda\
    \n\r reludehcs metsys/\
    \n\r;\"etaDtamrof\$ kimaroh\$ :ecnev aid ,)oirausu\$( reludehcs odartsiger\
    \_oirausU\"  ofni gol:\
    \n\r{=od )0 =< ]]oirausu\$=eman dnif reludehcs metsys/[ nel:[( fi:\
    \n\r{=od )0 > ]]]eliforpresu=eman dnif[ teg noitca gniggol metsys/[ nel:[(\
    \_fi:\
    \n\r};\"raey\$/ecnevaid\$/htnom\$\" etaDtamrof tes:\
    \n\r{=esle }\
    \n\r;\"ecnevaid\$-htnom\$-raey\$\" etaDtamrof tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;etaDtamrof lacol:\
    \n\r}}};)1 + raey\$( raey tes:\
    \n\r ;)\"naj\"( htnom tes:\
    \n\r{=od )\"ced\"= htnom\$( fi:\
    \n\r};)1 + raey\$( raey tes:\
    \n\r ;)\"10\"( htnom tes:\
    \n\r{=od )\"21\"= htnom\$( fi:\
    \n\r};)\"von\"( htnom tes:{=od )\"tco\"= htnom\$( fi:\
    \n\r};)\"gua\"( htnom tes:{=od )\"luj\"= htnom\$( fi:\
    \n\r};)\"pes\"( htnom tes:{=od )\"gua\"= htnom\$( fi:\
    \n\r};)\"nuj\"( htnom tes:{=od )\"yam\"= htnom\$( fi:\
    \n\r};)\"rpa\"( htnom tes:{=od )\"ram\"= htnom\$( fi:\
    \n\r};)\"bef\"( htnom tes:{=od )\"naj\"= htnom\$( fi:\
    \n\r\
    \n\r};)\"11\"( htnom tes:{=od )\"01\"= htnom\$( fi:\
    \n\r};)\"80\"( htnom tes:{=od )\"70\"= htnom\$( fi:\
    \n\r};)\"90\"( htnom tes:{=od )\"80\"= htnom\$( fi:\
    \n\r};)\"60\"( htnom tes:{=od )\"50\"= htnom\$( fi:\
    \n\r};)\"40\"( htnom tes:{=od )\"30\"= htnom\$( fi:\
    \n\r};)\"20\"( htnom tes:{=od )\"10\"= htnom\$( fi:\
    \n\r;)13 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )13 > ecnevaid\$( fi:\
    \n\r{=od )\"ced\"=htnom\$ ro \"tco\"=htnom\$ ro \"gua\"=htnom\$ ro \"luj\"\
    =htnom\$ ro \"yam\"=htnom\$ ro \"ram\"=htnom\$ ro \"naj\"=htnom\$ ro \"21\
    \"=htnom\$ ro \"01\"=htnom\$ ro \"80\"=htnom\$ ro \"70\"=htnom\$ ro \"50\"\
    =htnom\$ ro \"30\"=htnom\$ ro \"10\"=htnom\$( fi:\
    \n\r}}};)\"tco\"( htnom tes:{=od )\"pes\"= htnom\$( fi:\
    \n\r};)\"luj\"( htnom tes:{=od )\"nuj\"= htnom\$( fi:\
    \n\r};)\"yam\"( htnom tes:{=od )\"rpa\"= htnom\$( fi:\
    \n\r};)\"ced\"( htnom tes:{=od )\"von\"= htnom\$( fi:\
    \n\r};)\"01\"( htnom tes:{=od )\"90\"= htnom\$( fi:\
    \n\r};)\"70\"( htnom tes:{=od )\"60\"= htnom\$( fi:\
    \n\r};)\"50\"( htnom tes:{=od )\"40\"= htnom\$( fi:\
    \n\r};)\"21\"( htnom tes:{=od )\"11\"= htnom\$( fi:\
    \n\r;)03 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )03 > ecnevaid\$( fi:\
    \n\r{=od )\"von\"=htnom\$ ro \"pes\"=htnom\$ ro \"nuj\"=htnom\$ ro \"rpa\"\
    =htnom\$ ro \"11\"=htnom\$ ro \"90\"=htnom\$ ro \"60\"=htnom\$ ro \"40\"=h\
    tnom\$( fi:\
    \n\r}}}};)\"ram\"( htnom tes:\
    \n\r{=esle }\
    \n\r;)\"30\"( htnom tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;)82 - ecnevaid\$(  ecnevaid tes:\
    \n\r{=od )82 > ecnevaid\$( fi:\
    \n\r{=esle }\
    \n\r}};)\"ram\"( htnom tes:\
    \n\r{=esle }\
    \n\r;)\"30\"( htnom tes:\
    \n\r{=od )7noisrev\$( fi:\
    \n\r;)92 - ecnevaid\$( ecnevaid tes:\
    \n\r{=od )92 > ecnevaid\$( fi:\
    \n\r{=od )0=4%raey\$( fi:\
    \n\r{=od )\"bef\"=htnom\$ ro \"20\"=htnom\$( fi:\
    \n\r;)syadmuN\$+yad\$( ecnevaid tes:\
    \n\r{=od )13 =< syadmuN\$ && 1 => syadmuN\$( fi:\
    \n\r};eurt 7noisrev tes:\
    \n\r;]01 8 kimahcef\$ kcip: [ yad tes:\
    \n\r;] 7 5 kimahcef\$ kcip: [ htnom tes:\
    \n\r;] 4 0 kimahcef\$ kcip: [ raey tes:\
    \n\r{=esle }\
    \n\r;eslaf 7noisrev tes:\
    \n\r;] 6 4 kimahcef\$ kcip: [ yad tes:\
    \n\r;] 3 0 kimahcef\$ kcip: [ htnom tes:\
    \n\r;] 11 7 kimahcef\$ kcip: [ raey tes:\
    \n\r{=od ) 01.7 < rolav\$( fi:\
    \n\r;7noisrev lacol:\
    \n\r;]4 0 noisrev\$ kcip:[ rolav lacol:\
    \n\r;]]noisrev=eman-eulav teg ecruoser metsys/[ rtsot:[=eulav noisrev laco\
    l:\
    \n\r;ecnevaid lacol:\
    \n\r;yad lacol:\
    \n\r;htnom lacol:\
    \n\r;raey lacol:\
    \n\r;]etad teg kcolc metsys/[ kimahcef lacol:\
    \n\r;]emit teg kcolc metsys/[ kimaroh lacol:\
    \n\r;said\$ syadmuN lacol:\
    \n\r;resuteg\$ oirausu lacol:\
    \n\r;said labolg:\
    \n\r;resuteg labolg:"
/system watchdog
set automatic-supout=no ping-start-after-boot=3m ping-timeout=10s \
    watchdog-timer=no
/tool bandwidth-server
set authenticate=no enabled=no
/tool graphing interface
add store-on-disk=no
/tool romon
set enabled=yes
