#!/bin/bash
now=$(date "+%Y%m%d%H%M")
nowtime=$(date "+%Y%m%d%H%M")
twint "$@" > "twint_result_tmp_${nowtime}.txt"
awk '{print $0 " " "https://twitter.com/" substr($5, 2, length($5) - 2) "/status/" $1}' "twint_result_tmp_${nowtime}.txt" > twint_result_${now}.txt
if [ -f twint_result_tmp_${nowtime}.txt ]; then
    rm twint_result_tmp_${nowtime}.txt
fi
echo "done. save as twint_result_${now}.txt"
