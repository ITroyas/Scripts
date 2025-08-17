#!/bin/bash

while true; do
	MSG=$(zenity --entry --title='Заголовок' --text='Введи текст уведомления')
	[ -z "$MSG" ] && break

	TIME=$(zenity --entry --title='Время' --text='Задай время для срабатывания скрипта')
	[ -z "$TIME" ] && break

	SOUND="paplay ~/scripts/sounds/vizg.wav"

	echo "$SOUND && zenity --info --title='Уведомление' --text='$MSG'" | at "$TIME" 2>/dev/null
	zenity --info --title="Готово" --text="Уведомление установлено на $TIME"
done
