#!/bin/sh

delete()
{
if [ -e $1 ]
then
rm $1
fi
}

if [ ! -e tmp ]
then
mkdir tmp
fi

cd tmp
echo ""; echo "*** clean old files ***"
pwd
delete eb1-script*.txt
delete eb1-script*.txt
delete eb3-script*.txt
delete discovery*.txt
delete discovery*.txt
delete voltage.html
delete voltage.min.js
delete charts.html
delete charts.min.js
ls

echo ""; echo "*** update files ***"
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/chartjs/charts.html
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/chartjs/charts.min.js
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/chartjs/voltage.html
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/chartjs/voltage.min.js
#
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/eb1-script.js
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/eb3-script.js
#
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/eb1-discovery-EB1.txt
wget -q https://github.com/nikito7/easyhan/raw/dev/V1/eb3-discovery-EB3.txt
#
echo ""; echo "*** fix files ***"
mv eb1-discovery-EB1.txt discovery-EB1.txt
mv eb3-discovery-EB3.txt discovery-EB3.txt
mv eb1-script.js eb1-script.txt
mv eb3-script.js eb3-script.txt
#
cd ..
#
mkdir EB1 || rm EB1/*
mkdir EB3 || rm EB3/*
mkdir EB5 || rm EB5/*
mkdir EB8 || rm EB8/*
#
cp tmp/charts* EB1/
cp tmp/charts* EB3/
cp tmp/charts* EB5/
cp tmp/charts* EB8/
#
cp tmp/voltage* EB1/
cp tmp/voltage* EB3/
cp tmp/voltage* EB5/
cp tmp/voltage* EB8/
#
cat tmp/eb1-script.txt > EB1/script.txt
cat tmp/eb1-script.txt | sed -e 's/mN1/mN2/g' > EB1/script-mN2.txt
#
cat tmp/eb3-script.txt > EB3/script.txt
#
cat tmp/eb3-script.txt | sed -e 's/EB3/EB5/g' > EB5/script.txt
cat tmp/eb3-script.txt | sed -e 's/EB3/EB8/g' > EB8/script.txt
#
cp tmp/discovery-EB1.txt EB1/
cp tmp/discovery-EB3.txt EB3/
#
cat tmp/discovery-EB3.txt > EB5/discovery-EB5.txt
cat tmp/discovery-EB3.txt > EB8/discovery-EB8.txt
#
sed -i -e 's/edpbox3/edpbox5/g' EB5/discovery-EB5.txt
sed -i -e 's/EB3/EB5/g' EB5/discovery-EB5.txt
sed -i -e 's/eb3/eb5/g' EB5/discovery-EB5.txt
#
sed -i -e 's/edpbox3/edpbox8/g' EB8/discovery-EB8.txt
sed -i -e 's/EB3/EB8/g' EB8/discovery-EB8.txt
sed -i -e 's/eb3/eb8/g' EB8/discovery-EB8.txt
#
echo ""; echo "*** done  ***"
ls -l tmp/
#

delete HAN.zip
zip -r -T HAN.zip *

# EOF

