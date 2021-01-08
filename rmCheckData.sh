#!/bin/bash

date_year=`/usr/bin/date "+%Y"`
date_moush=`/usr/bin/date "+%m"`
date_data=`/usr/bin/date "+%d"`

# 日期不等于1 不需要特殊处理
if [  $date_data -ne 01  ]; then
# 日期-1
    date_data=  expr $date_data - 1 
#    echo $(find ./checkData -name | grep -E "^/$date_year-$date_moush-$date_data")
echo "hh"
echo $date_data
echo "hh"
   echo $(find ./checkData -print0 | grep -E "[0-9]{4}-[0-9]{1,2}-$date_data")

    kill $$
fi


echo $date_data
