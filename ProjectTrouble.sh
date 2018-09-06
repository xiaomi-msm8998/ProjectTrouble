#!/bin/bash
username=arian
date="$(date '+%Y%m%d')"
device="sagit"
buildtype="Official"
rom="Havoc-OS-v2.0"
mega="yes"
rompath="/home/arian/android/havoc"
outdir="/home/arian/ProjectTrouble"
ptsource="/home/arian/ProjectTrouble/source"

cd "$rompath"
cd out/target/product/"$device"
rm -rf "$outdir"/ProjectTrouble-"$device"-"$date"
mkdir "$outdir"/ProjectTrouble-"$device"-"$date"
unzip "$rom"-$date-"$device"-"$buildtype".zip -d "$outdir"/ProjectTrouble-"$device"-"$date"
cd "$outdir"/ProjectTrouble-"$device"-"$date"
rm system.new.dat.br system.patch.dat  system.transfer.list
rm -rf META-INF/ system/
cp -r "$ptsource"/META-INF ./
zip -r ProjectTrouble-"$device"-"$date".zip ./

if [ "$mega" = "yes" ]
then
echo -e ${cya}"Uploading to mega.nz"
megaput --path /Root/ProjectTrouble/ProjectTrouble-"$device"-"$date".zip ProjectTrouble-"$device"-"$date".zip
wait
echo -e ${grn}"Uploaded file succesfully"
fi
