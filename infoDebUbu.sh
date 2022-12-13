#!/bin/bash
# run as bash infoDeb.sh
echo "Info about the system!"
cat /etc/issue
echo -e "--- \nDebian version:"; cat /etc/debian_version
echo ""
lsb_release -a
echo -e "--- \nInfo about distribution:"; cat /etc/lsb-release; cat /proc/version
uname -a
echo -e "--- \nCpuInfo:"
echo -e "Number of processors:"
ncpu=`cat /proc/cpuinfo | grep "physical id" | tail -n 1 | awk {'print $4'};`
let "nncpu=$ncpu+1"
echo  $nncpu
cat /proc/cpuinfo | grep 'vendor' | uniq
cat /proc/cpuinfo | grep 'model name' | uniq
cat /proc/cpuinfo | grep 'cpu cores' | tail -n 1
echo -e "Number of threads"; cat /proc/cpuinfo | grep 'siblings' | tail -n 1
echo -e "Number of threads all:"; cat /proc/cpuinfo | grep processor | wc -l
echo -e "--- \nMemoryInfo:"
mem=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`
let "memGB=$mem/(1024*1024)"
let "memGBo=$mem%(1024*1024)"
echo  $memGB","$memGBo" GB"
echo "---"; cat /proc/scsi/scsi
echo -e "--- \nDiskInfo (superuser):"
fdisk -l | grep '/cci'
fdisk -l | grep '/sd'
echo ""
df -h | grep -v loop | grep -v tmp | grep -v udev
echo -e "---\nChecking other disks (superuser):"
fdisk -l | grep '/hd' # via ATA
fdisk -l | grep '/vd' #virtual
echo -e "--- \nInfo about network interfaces:"
ls -la /sys/class/net/ | awk '{print $9}' | tail -n +4
