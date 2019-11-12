#!/bin/bash

if [ "$1" != "" ]; then
  RESULT=`ps -aux | grep "jupyter-notebook --no-browser --port $1 --ip 0.0.0.0"`

  if [ "$1" == "stop" ]; then
    kill -9 `cat save_pid.txt`
    rm save_pid.txt
  else
    if [ "${RESULT:-null}" = null ]; then
      echo "Jupyter notebook already running"
    else
      echo "Jupyter notebook not found. Starting it"
      nohup jupyter notebook --no-browser --port $1 --ip 0.0.0.0 &
      echo $! > save_pid.txt
      TOKEN=`cat nohup.out | grep -o "token=[a-z0-9]*"| sed -n 1p`
      echo $TOKEN
    fi
  fi
else
  echo "Missing argument port: ./jupyter.sh <port>"
fi
