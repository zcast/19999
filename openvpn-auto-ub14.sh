#! / bin / ทุบตี
#script โดย K-KRIT สำหรับ Ubuntu 14.04

ถ้า [[$ EUID -ne 0]]; แล้วก็
   echo "สคริปต์นี้ต้องใช้งานเป็น root" 
   ทางออก 1
Fi

#install openvpn

Y | apt-get purge openvpn easy-rsa;
Y | apt-get purge squid3;
apt-get update
MYIP = $ (wget -qO- ipv4.icanhazip.com);
MYIP2 = "s / xxxxxxxxx / $ MYIP / g";

apt-get update
apt-get install bc -y
apt-get -y ติดตั้ง openvpn easy-rsa
apt-get -y install python;

wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpn.tar"
wget -O /etc/openvpn/default.tar "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/default.tar"
cd / etc / openvpn /
tar xf openvpn.tar
tar xf default.tar
cp sysctl.conf / etc /
cp ก่อนหน้ากฎ / etc / ufw /
cp ufw / etc / default /
rm sysctl.conf
rm ก่อนหน้ากฎ
rm ufw
บริการ openvpn รีสตาร์ท

#install squid3

apt-get -y ติดตั้ง squid3;
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.bak
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/squid.conf"
sed -i $ MYIP2 /etc/squid3/squid.conf;
บริการ squid3 เริ่มต้นใหม่

#config ไคลเอ็นต์
cd / etc / openvpn /
wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/client.ovpn"
sed -i $ MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn / root /

ufw อนุญาตให้ ssh
ufw อนุญาตให้ 1194 / tcp
ufw อนุญาตให้ 8080 / tcp
ufw อนุญาต 3128 / tcp
ufw อนุญาต 80 / tcp
ใช่ | sudo ufw เปิดใช้งาน

# สคริปต์ดาวน์โหลด
cd / usr / bin
wget -O สมาชิก "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/member.sh"
wget -O menu "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/usernew.sh"
wget -O speedtest "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/speedtest_cli.py"
wget -O userd "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/deluser.sh"
wget -O ทดลอง "https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/trial.sh"
echo "0 0 * * * root / usr / bin / reboot"> /etc/cron.d/reboot
#echo "* * * * * บริการ dropbear เริ่มบริการใหม่"> /etc/cron.d/dropbear
สมาชิก chmod + x
เมนู chmod + x
chmod + x ผู้ใช้ใหม่
chmod + x speedtest
chmod + x userd
ทดลองใช้ chmod + x
ชัดเจน

printf '######################################### n'
printf '# Script โดย K-KRIT # \ n'
printf '# # \ n'

printf '# # \ n'
printf '# พิมพ์เมนูเพื่อใช้คำสั่งต่าง ๆ # \ n'
printf '######################################################### รายการ
echo -e "ดาวน์โหลดไฟล์: /root/client.ovpn\n\n"
printf '\ n \ n เพิ่มผู้ใช้โดยใช้คำสั่ง useradd'
printf '\ n \ n ตั้งรหัสโดยใช้คำสั่ง passwd'
printf '\ n \ n คุณจำเป็นต้องฟื้นฟูระบบหนึ่งรอบ (y / n):'
อ่าน
ถ้า [$ a == 'y']
แล้วก็
รีบูต
อื่น
ทางออก
Fi