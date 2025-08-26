#!/bin/bash

IP=$(hostname -I | awk '{print $1}')
MAC=$(ip link | awk '/wl/{getline; print $2}')
OS=$(lsb_release -d | cut -f2)
YADRO=$(uname -r)
HOST=$(hostname)
UPTIME=$(uptime -p)
USER=$(who | wc -l)
CPU=$(lscpu | grep 'Model name' | cut -d: -f2 | xargs)
RAM=$(free -h | awk '/Mem/ {print $3 " из " $2}')
DISK=$(df -h --total | grep total | awk '{print $3"/"$2}')
GPU=$(lspci | grep -i 'vga' | cut -d: -f3| xargs)


zenity --title="Info about PC" --list --column="Параметр" --column="Значение" --ok-label="Okay" --cancel-label="Close" \
--width=600 --height=600 \
"IP" "$IP" \
"MAC" "$MAC" \
"OС" "$OS" \
"Ядро" "$YADRO" \
"Хост" "$HOST" \
"Аптайм" "$UPTIME" \
"Пользователей" "$USER" \
"ЦПУ" "$CPU" \
"ОЗУ" "$RAM" \
"Диск" "$DISK" \
"ГПУ" "$GPU" \
--separator=" = " \
--print-column=1,2

