#!/bin/bash



start_time=$(date +%s)

sleep 10

end_time=$(date +%s)

tt=$(($end_time-$start_time))
echo "Execution start:" $start_time
echo "Execution ended:" $end_time
echo "time taken for exectuion:" $tt