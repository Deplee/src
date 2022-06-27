#!/bin/bash -
#===============================================================================
#
#          FILE: checklist.sh
#
#         USAGE: ./checklist.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: 1zuna <dkapitsev@gmail.com>
#  ORGANIZATION:
#       CREATED: 04/13/2022 19:57
#      REVISION:  ---
#===============================================================================

#set -x

##путь к лог-файлу
LogFile=/home/tcadmin/checklist.log
CheckFile=/home/tcadmin/check_sbs

####----Описание функций----####

##функция логирования

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  log
#   DESCRIPTION: log events Into $LogFile
#    PARAMETERS: $@
#       RETURNS: nothing
#-------------------------------------------------------------------------------
function log
{
	echo "$@" | tee -a $LogFile > /dev/null 2>&1
}

####----Получение Wi-Fi----####

wificheck=$(nmcli d | grep ^[w-z] | awk '{print $1}')

####----Получение Bluetooth----####
bt=$(systemctl status bluetooth.service | grep 'Active:' | awk '{print $3}')

####----Получение списка оборудования----####

## получаем idProduct (web-cam)
lswebc=$(lsusb -v | grep idProduct | grep -e '0x082B' -e '0x0836' -e '0x2284' -e '0x0810' -e '0x0819' -e '0x0825' -e '0x3420' -e '0x6340' -e '0x2700' -e '0x0d01' -e '0x0110' -e '0x3399' -e '0x62e0' -e '0x62c0' -e '0x58bb' -e '0xe207' -e '0xe261' -e '0x260e' -e '0x4083' -e '0x0829' -e '0x0824' -e '0x081b' -e '0x081d' -e '0x0826' -e '0x0821' -e '0x080a' -e '0x082d' -e '0x0804' -e '0x0807' -e '0x0823' -e '0x0822' -e '0x0805' -e '0x09a5' -e '0x3500' -e '0x3450' -e '0xc40a' -e '0x58b0' -e '0x0772' -e '0x0766' -e '0x0761' -e '0x0728' -e '0x2622' -e '0x705e' -e '0x7089' -e '0x2625' -e '0x605e' -e '0x705f'| awk '{print $2}')

##получаем idVendor (pos,brcd,tm)
lsbrcd=$(lsusb -v | grep idVendor | grep -e '0x05e0' -e '0x05f9' -e '0x0c2e' -e '0x1eab' -e '0x0536' -e '0x2dd6' | awk '{print $2}')
lstm=$(lsusb -v | grep idVendor | grep -e '0x067b' -e '0xa420' | awk '{print $2}')
lspos=$(lsusb -v | grep idVendor | grep -e '0x11ca' -e '0x1234' -e '0x079b' | awk '{print $2}')

##получаем список принтеров
bpls=$( lpstat -v | grep '///dev/null' | awk '{print $4}')
bplsO=$(lpstat -v | grep usb:// | awk '{print $4$5$6}')
mfunames=$(lpc status  | grep -e "Lexmark" -e  "Xerox" | awk '{print $1}' | tr -s ':' ' ' | head -n1 | cut -c1-5)

####----Определяем подключено ли оборудование----####

##определяем включен ли: Wi-Fi
if [[ $wificheck == "" ]]; then
	wifiL=TRUE
else
	wifiL=FALSE
fi

##определяем включен ли: Bluetooth
if [[ $bt == "(dead)" ]]; then
	bltL=TRUE
else
	bltL=FALSE
fi

####----Получение моделей----####

##получаем модель СШК
case $lsbrcd in
0x05e0)
	brcdname=Motorolla/Zebra
	brcdL=TRUE ;;
0x05f9)
	brcdname=DatalogicMagellan
	brcdL=TRUE ;;
0x0c2e)
	brcdname=HoneyWell/Metrologic
	brcdL=TRUE ;;
0x1eab)
	brcdname=NewLand
	brcdL=TRUE ;;
0x0536)
	brcdname=HoneyWell-4600g
	brcdL=TRUE ;;
0x2dd6)
	brcdname=Mertech
	brcdL=TRUE ;;
*)
	brcdL=FALSE
	brcdname='Неизвестно' ;;
esac

##получаем модель ТМ
case $lstm in
0x067b)
	tmL=TRUE
	tmname=Aladdin ;;
0xa420)
	tmL=TRUE
	tmname=InfoCrypt ;;
*)
	tmL=FALSE
	tmname='Неизвестно' ;;
esac

##получаем модель МФУ
case $mfunames in
Lexma)
	mfuname=Lexmark
	mfuL=TRUE ;;
Xerox)
	mfuname=Xerox
	mfuL=TRUE ;;
*)
	mfuL=FALSE
	mfuname='Неизвестно' ;;
esac

##получаем модель БП
if [[ $bpls == '///dev/null' ]]; then
	bpL=TRUE
	bpname=EPSON
elif [[ $bplsO == 'usb://EPSON/TM-P2.01' ]]; then
	bpL=TRUE
	bpname=EPSON
elif [[ $bplsO == 'usb://Unknown/Printer' ]]; then
	bpL=TRUE
	bpname=Olivetty
else
	bpL=FALSE
	bpname='Неизвестно'
fi

##получаем модель POS
case $lspos in
0x11ca)
	posL=TRUE
	posname=VeriFone ;;
0x1234)
	posL=TRUE
	posname=PAX ;;
0x079b)
	posL=TRUE
	posname=Ingenico ;;

*)
	posL=FALSE
	posname='Неизвестно' ;;
esac

##получаем модель WebCam
case $lswebc in
0x082B)
	webcL=TRUE
	webcname=Logitech-C170;;
0x0836)
	webcL=TRUE
	webcname=Logitech-B525;;
0x2284)
	webcL=TRUE
	webcname=KREZ-CMR01;;
0x0810)
	webcL=TRUE
	webcname=Microsoft-LifeCam-HD-3000;;
0x0819)
	webcL=TRUE
	webcname=Logitech-C210;;
0x0825)
	webcL=TRUE
	webcname=Logitech-C270;;
0x3420)
	webcL=TRUE
	webcname=A4TechPKS-730G;;
0x6340)
	webcL=TRUE
	webcname=CanyonCNE-CWC;;
0x2700)
	webcL=TRUE
	webcname=A4Tech-PC;;
0x0d01)
	webcL=TRUE
	webcname=Aveo;;
0x0110)
	webcL=TRUE
	webcname=CBR-CW-834M;;
0x3399)
	webcL=TRUE
	webcname=Arkmicro-PC-Camera;;
0x62e0)
	webcL=TRUE
	webcname=Microdia-MSI-Starcam-Racer;;
0x62c0)
	webcL=TRUE
	webcname=Microdia-Sonix-WebCam;;
0x58bb)
	webcL=TRUE
	webcname=Defender-GLens-2597;;
0xe207)
	webcL=TRUE
	webcname=HP-WebCam-2300;;
0xe261)
	webcL=TRUE
	webcname=Suyin-WebCam;;
0x260e)
	webcL=TRUE
	webcname=D-LINK-DSB-C320;;
0x4083)
	webcL=TRUE
	webcname=Creative-Live-Cam-Socialize;;
0x0829)
	webcL=TRUE
	webcname=Logitech-C110;;
0x0824)
	webcL=TRUE
	webcname=Logitech-C160;;
0x081b)
	webcL=TRUE
	webcname=Logitech-C310;;
0x081d)
	webcL=TRUE
	webcname=Logitech-C510;;
0x0826)
	webcL=TRUE
	webcname=Logitech-C525;;
0x0821)
	webcL=TRUE
	webcname=Logitech-C910;;
0x080a)
	webcL=TRUE
	webcname=Logitech-C905;;
0x082d)
	webcL=TRUE
	webcname=Logitech-C920;;
0x0804)
	webcL=TRUE
	webcname=Logitech-250;;
0x0807)
	webcL=TRUE
	webcname=Logitech-500;;
0x0823)
	webcL=TRUE
	webcname=Logitech-B910;;
0x0822)
	webcL=TRUE
	webcname=Logitech-Cisco-VTCamera3;;
0x0805)
	webcL=TRUE
	webcname=Logitech-WebCam-300;;
0x09a5)
	webcL=TRUE
	webcname=Logitech-QuickCam-3000;;
0x3500)
	webcL=TRUE
	webcname=A4Tech-HD-PC-Camera;;
0x3450)
	webcL=TRUE
	webcname=A4Tech-USB-PC-Camera-E;;
0xc40a)
	webcL=TRUE
	webcname=A4Tech-USB-PC-Camera-J;;
0x58b0)
	webcL=TRUE
	webcname=Realtek-AF-FULL-HD;;
0x0772)
	webcL=TRUE
	webcname=Microsoft-LifeCam-Studio;;
0x0766)
	webcL=TRUE
	webcname= Microsoft-LifeCam-VX800;;
0x0761)
	webcL=TRUE
	webcname=Microsoft-LifeCam-VX2000;;
0x0728)
	webcL=TRUE
	webcname=Microsoft-LifeCam-VX5000;;
0x2622)
	webcL=TRUE
	webcname=Genius-Eye-312;;
0x705e)
	webcL=TRUE
	webcname=Genius-Eye-320SE;;
0x7089)
	webcL=TRUE
	webcname=Genius-FaceCam-320;;
0x2625)
	webcL=TRUE
	webcname=Genius-iSlim-310;;
0x605e)
	webcL=TRUE
	webcname=Genius-iSlim-320;;
0x705f)
	webcL=TRUE
	webcname=Genius-iSlim-321R;;
*)
	webcL=FALSE
	webcname='Неизвестно' ;;
esac

####----Логическая проверка настройки----####
resprov='Настроен'
comment='Проверить'
##проверяем настроен ли: Wi-Fi
case $wifiL in
TRUE)
	resprovwifi='Отключен'
	resultwifi="$wifiL Wi-Fi $resprovwifi $resprov" ;;
*)
	resultwifi="$wifiL Wi-Fi Неизвестно $comment" ;;
esac

##проверяем настроен ли: Bluetooth
case $bltL in
TRUE)
	resprovblth='Отключен'
	resultblth="$bltL Bluetooth $resprovblth $resprov" ;;
*)
	resultblth="$bltL Bluetooth Неизвестно $comment" ;;
esac

##проверяем настроен ли: СШК
case $brcdL in
TRUE)
	resultbrcd="$brcdL СШК $brcdname $resprov" ;;
*)
	resultbrcd="$brcdL СШК $brcdname $comment" ;;
esac

##проверяем настроен ли: ТМ
case $tmL in
TRUE)
	resulttm="$tmL TM $tmname $resprov" ;;
*)
	resulttm="$tmL TM $tmname $comment" ;;
esac

##проверяем настроен ли: МФУ
case $mfuL in
TRUE)
	resultmfu="$mfuL МФУ $mfuname $resprov" ;;
*)
	resultmfu="$mfuL МФУ $mfuname $comment" ;;
esac

##проверяем настроен ли: БП
case $bpL in
TRUE)
	resultbp="$bpL БанковскийПринтер $bpname $resprov" ;;
*)
	resultbp="$bpL БанковскийПринтер $bpname $comment" ;;
esac

##проверяем настроен ли: POS
case $posL in
TRUE)
	resultpos="$posL POS $posname $resprov" ;;
*)
	resultpos="$posL POS $posname $comment" ;;
esac

##проверяем настроен ли: WebCam
case $webcL in
TRUE)
	resultwebcam="$webcL Web-камера $webcname $resprov" ;;
*)
	resultwebcam="$webcL Web-камера $webcname $comment" ;;
esac

SIZE="--width=700 --height=350"

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  checklist
#   DESCRIPTION: main function of script
#    PARAMETERS: no
#       RETURNS: nothing
#-------------------------------------------------------------------------------
##старт проверок в GUI
function checklist
{

zenity --info --text="Для настройки рабочего места необходимо воспользоваться инструкцией по настройке рабочего места на ТК в ВСП. Инструкция расположена на Wiki СБС." --width 700 --height 150
if [ $? -eq 0 ]; then
	fio=$(zenity --entry --title="Чек-лист СБС ТК Linux ВСП" --text "ФИО инженера проводившего работы  (например Иванов Иван Иванович):" --width 700 --height 150)
elif [ $? -eq 1 ]; then
	zenity --warning --text "Вы отменили чек-лист. Данные не сохранены" --width 350 --height 150
	exit 1;
fi

if [ $? -eq 1 ]; then
	zenity --warning --text "Вы отменили чек-лист. Данные не сохранены" --width 350 --height 150
	rm -r $LogFile > /dev/null 2>&1
	exit 1;
fi

if [[ -z $fio && ${fio+x} ]]; then
	zenity --error --text "Поле ФИО не может быть пустым! Необходимо заполнить все поля!" --width 450 --height 150
	rm -r $LogFile > /dev/null 2>&1
	exit 1;
else
	log "FIO: $fio"
fi


zno=$(zenity --entry --title="Чек-лист СБС ТК Linux ВСП" --text "Номер ЗНО (не ID запроса):" --width 350 --height 150)

if [ $? -eq 1 ]; then
	zenity --warning --text "Вы отменили чек-лист. Данные не сохранены" --width 350 --height 150
	rm -r $LogFile > /dev/null 2>&1
	exit 1;
fi

if [[ -z $zno && ${zno+x}  ]]; then
	zenity --error --text "Поле ЗНО не может быть пустым! Необходимо заполнить все поля!" --width 450 --height 150
	rm -r $LogFile > /dev/null 2>&1
	exit 1;
else
	log "ZNO: $zno"
fi

d=$(date +%D_%H:%M | tr -s "_" " ")
log "Date: $d"

list=$(zenity --list --checklist $SIZE \
		--title "Чек-лист СБС ТК Linux ВСП" --ok-label "Записать" --cancel-label "Выйти" \
		--separator '\n' \
		--text "Проверка оборудования" \
		--column	"Настроено" \
		--column	"Оборудование" \
		--column	"Значение" \
		--column	"Комментарий" \
		$resultwifi \
		$resultblth \
		$resultbrcd\
		$resulttm \
		$resultmfu \
		$resultbp \
		$resultpos \
		$resultwebcam)

if [ $? -eq 1 ]; then
		zenity --info --text "Выход. Отмена записи данных."  --width 500 --height 150
		rm -r $LogFile > /dev/null 2>&1
		exit 1;
fi

zenity --question --text "Вы подтверждаете, что настройки произведены согласно памятки СБС по настройке ТК Linux? \n$list" --ok-label="Подтверждаю" --cancel-label="Перезапустить чек-лист" --width 700 --height 200
if [ $? -eq 0 ]; then
#wifi
if [[ $wifiL != 'TRUE' && $list != *Wi-Fi* ]] ; then
	log "WiFi: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $wifiL = 'TRUE' && $list = *Wi-Fi* ]]; then
	log "WiFi: 1" #настроено автоматом
elif [[ $wifiL != 'TRUE' && $list = *Wi-Fi* ]] ; then
	log "WiFi: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $wifiL == 'TRUE' && $list != *Wi-Fi* ]] ; then
	log "WiFi: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#blth
if [[ $bltL != 'TRUE' && $list != *Bluetooth* ]] ; then
	log "BLTH: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $bltL = 'TRUE' && $list = *Bluetooth* ]]; then
	log "BLTH: 1" #настроено автоматом
elif [[ $bltL != 'TRUE' && $list = *Bluetooth* ]] ; then
	log "BLTH: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $bltL == 'TRUE' && $list != *Bluetooth* ]] ; then
	log "BLTH: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#BRCD
if [[ $brcdL != 'TRUE' && $list != *СШК* ]] ; then
	log "BRCD: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $brcdL = 'TRUE' && $list = *СШК* ]]; then
	log "BRCD: 1" #настроено автоматом
elif [[ $brcdL != 'TRUE' && $list = *СШК* ]] ; then
	log "BRCD: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $brcdL == 'TRUE' && $list != *СШК* ]] ; then
	log "BRCD: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#tm
if [[ $tmL != 'TRUE' && $list != *TM* ]] ; then
	log "TM: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $tmL = 'TRUE' && $list = *TM* ]]; then
	log "TM: 1" #настроено автоматом
elif [[ $tmL != 'TRUE' && $list = *TM* ]] ; then
	log "TM: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $tmL == 'TRUE' && $list != *TM* ]] ; then
	log "TM: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#MFU
if [[ $mfuL != 'TRUE' && $list != *МФУ* ]] ; then
	log "MFU: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $mfuL = 'TRUE' && $list = *МФУ* ]]; then
	log "MFU: 1" #настроено автоматом
elif [[ $mfuL != 'TRUE' && $list = *МФУ* ]] ; then
	log "MFU: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $mfuL == 'TRUE' && $list != *МФУ* ]] ; then
	log "MFU: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#BP
if [[ $bpL != 'TRUE' && $list != *БанковскийПринтер* ]] ; then
	log "BP: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $bpL = 'TRUE' && $list = *БанковскийПринтер* ]]; then
	log "BP: 1" #настроено автоматом
elif [[ $bpL != 'TRUE' && $list = *БанковскийПринтер* ]] ; then
	log "BP: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $bpL == 'TRUE' && $list != *БанковскийПринтер* ]] ; then
	log "BP: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#POS
if [[ $posL != 'TRUE' && $list != *POS* ]] ; then
	log "POS: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $posL = 'TRUE' && $list = *POS* ]]; then
	log "POS: 1" #настроено автоматом
elif [[ $posL != 'TRUE' && $list = *POS* ]] ; then
	log "POS: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $posL == 'TRUE' && $list != *POS* ]] ; then
	log "POS: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi
#WebCam
if [[ $webcL != 'TRUE' && $list != *Web* ]] ; then
	log "WebCam: 0" #не настроено автоматом и не выставлено в ручную
elif [[ $webcL = 'TRUE' && $list = *Web* ]]; then
	log "WebCam: 1" #настроено автоматом
elif [[ $webcL != 'TRUE' && $list = *Web* ]] ; then
	log "WebCam: 2" #не настроено автоматом - выставлено "настроено" в ручную
elif [[ $webcL == 'TRUE' && $list != *Web* ]] ; then
	log "WebCam: 3" #настроено автоматом - выставлено "не настроено" в ручную
fi

zenity --info --text "Данные записаны" --width 200 --height 150
cat $LogFile | awk 'begin{IFS= " "} {print $2" "$3" "$4}' > $CheckFile
/opt/microsoft/cm/bin/ccmexec -rs hinv -d  #> /dev/null 2>&1
/opt/microsoft/cm/bin/ccmexec -rs sinv -d  #> /dev/null 2>&1
/opt/microsoft/cm/bin/ccmexec -rs policy -d  #> /dev/null 2>&1
/opt/microsoft/cm/bin/ccmexec -rs eval -d  #> /dev/null 2>&1
	exit 0;
elif [ $? -eq 1 ]; then
	zenity --info --text "Отмена. Чек-лист будет запущен заново. Данные не записаны." --width 300 --height 150
	rm -r $LogFile > /dev/null 2>&1
	checklist
fi

chkf=$(cat /home/tcadmin/check_sbs | wc -l)

if [ $chkf -ne 11 ]; then
	zenity --error --text "Чек-лист заполнен не корректно. Данные не сохранены."
	rm -r $LogFile $CheckFile> /dev/null 2>&1
	exit 1;
fi

}

rm -r $LogFile > /dev/null 2>&1
while :
	do
	checklist
done
