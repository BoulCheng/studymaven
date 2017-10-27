#!/bin/sh
  
SERVER=/home/jhuser/rental/service/rental-service-meal-1.0.0
cd $SERVER
  
case "$1" in  

  start)  
    nohup java -Xmx128m -jar rental-service-meal-1.0.0.jar -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n >/dev/null 2>&1 &
    echo $! > $SERVER/rental-service-meal.pid
    ;;  
  
  stop)  
    process_dir="rental-service-meal"
    process_pid=$(ps aux | grep $process_dir | grep -v 'grep' | awk '{print $2}')
    kill -9 $process_pid #kill pid
  
  restart)  
    $0 stop  
    sleep 1  
    $0 start  
    ;;  
  
  *)  
    echo "Usage: run.sh {start|stop|restart}"  
    ;;  
  
esac 
exit 0
