#!/bin/bash

path=/hdfs/data/data1
name_of_directory=data1
dir=$path/$name_of_directory
filename_excel=daily_market_proce.xlsx
source_dir=/local/data/market
logfile="$dir/logsuccess.txt"

if [ -d $dir ];
then
  cp $source_dir/$filename_excel $path
  echo "File Moved Successfully" >> "$logfile"
else
  echo "${name_of_directory} Directory Not Exists!"
  mkdir $dir
  exit 1
fi