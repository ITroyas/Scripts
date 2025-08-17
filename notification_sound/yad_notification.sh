#!/bin/bash

while true; do

	res=$(yad --form \
	--geometry="500x250" \
	--title="Система оповещения\уведомления" \
	--field="Введи сообщение::TXT" "" \
	--field="Дата::DT" \
	--field="Время::TIME")

	[ $? -ne 0 ] && exit 0

	msg=$(echo "$res" | cut -d'|' -f1)
	date=$(echo "$res" | cut -d'|' -f2)
	time=$(echo "$res" | cut -d'|' -f3)

	if [[ -z "$msg" || -z "$date" || -z "$time" ]]; then
		yad --warning --title="ERROR" --text="Все поля должны быть заполнены"
		continue
	fi

	yad --info --title="Готово" --text="Создано на дату: $date $time"
	echo "yad --info --title='Notification' --text='$msg'" | at "$time $date"
done

