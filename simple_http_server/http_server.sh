#!/bin/bash

function server () {
  while true
  do
    message_arr=()
    check=true
    while $check
    do
      read line
      message_arr+=($line)
      if [[ "${#line}" -eq 1 ]]
      then
        check=false
      fi
    done
    method=${message_arr[0]}
    path=${message_arr[1]}
    if [[ $method = 'GET' ]]
    then
        if [[ -f "./www/${path}" ]]
        then
            echo -e "HTTP/1.1 200 OK\r\nContent-Type:text/html; charset=utf-8\r\nContent_Length: $(wc -c < './www/'$path)\r\n"
            cat "./www/$path"
        else
            echo -e "HTTP/1.1 404 Not Found"
            echo -e "Content-Length 0"
        fi
    else
        echo -e "HTTP/1.1 400 Bad Request"
        echo -e "Content-Length 0\r\n"
    fi
  done
}

coproc SERVER_PROCESS { server; }
while true
do
  netcat -lvp 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
done