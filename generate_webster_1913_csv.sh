#!/bin/bash

sudo apt-get install -y stardict-tools unzip

if [ ! -f dictionary.zip ]; then
  wget https://s3.amazonaws.com/jsomers/dictionary.zip
  unzip dictionary.zip
fi

tar_name=stardict-dictd-web1913-2.4.2
if [ ! -d $tar_name ]; then
  tar xvjf dictionary/${tar_name}.tar.bz2
fi

dict_name=dictd_www.dict.org_web1913
if [ ! -f ${tar_name}/${dict_name}.dict ]; then
  mv ${tar_name}/${dict_name}.dict.dz ${tar_name}/${dict_name}.dict.gz;gunzip ${tar_name}/${dict_name}.dict.gz
fi

if [ ! -d ./penelope ]; then
  git clone http://github.com/pettarin/penelope
fi

python ./penelope/src/penelope.py -p ${tar_name}/${dict_name} --sd --output-csv

mv ${tar_name}/${dict_name}.csv ./webster1913.csv
