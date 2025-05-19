#!/bin/bash

function server () {
  while true
  do
    read method path version
    if [[ $method = 'GET' ]]
    then
        if [[ -e "./www/${path}" ]]
        then
            echo -e "HTTP/1.1 200 OK\r\n\r\n"
            cat "./www/${path}"
        else
            echo -e "HTTP/1.1 404 Not Found\r\n\r\n"
        fi
    else
        echo -e "HTTP/1.1 400 Bad Request"
    fi
  done
}

coproc SERVER_PROCESS { server; }

netcat -lvp 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}