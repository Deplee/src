#import os
import subprocess
from tkinter import messagebox
from tkinter import *
import logging


logging.basicConfig(
    filename='1.log',
    filemode='a',
    format='%(asctime)s %(message)s', 
    datefmt='\n%d-%b %H:%M',
    level=logging.INFO)

root = Tk()
root.title("Чек-лист СБС по настрйоке рабочего места на ТК ВСП")
root.geometry("800x450")
label1 = LabelFrame(root, text="Проверка периферийного оборудования", font=20)
label1.pack(fill=BOTH, expand=True)


get_wifi = subprocess.check_output("nmcli d | grep ^[w-z] | awk '{print $1}'", shell=True)
get_wifi = str(get_wifi, 'utf-8')

state_wifi = IntVar()

if get_wifi == "":
    state_wifi.set(1)
else:
    state_wifi.set(0)

get_bankprinter = subprocess.check_output("lpstat -v | grep usb:// | awk '{print $4$5$6}'", shell=True)
get_bankprinter = str(get_bankprinter, 'utf-8')
state_bankprinter = IntVar()

if 'usb://Unknown/Printer' in get_bankprinter:
    bp_model = 'Olivetty'
    state_bankprinter.set(1)
elif 'usb://EPSON/TM-P2.01' in get_bankprinter:
    bp_model = 'Epson'
    state_bankprinter.set(1)

get_brcd = subprocess.check_output("lsusb -v | grep idVendor | grep -e '0x05e0' -e '0x05f9' -e '0x0c2e' -e '0x1eab' -e '0x0536' -e '0x2dd6' | awk '{print $2}'", shell=True)
get_brcd = str(get_brcd, 'utf-8')
brcd_model = 'Не определено. Не настроено'
state_brcd = IntVar()

if '0x05e0' in get_brcd:
    brcd_model = 'Motorolla \ Zebra'
    state_brcd.set(1)
elif '0x05f9' in get_brcd:
    brcd_model = 'DatalogicMagellan'
    state_brcd.set(1)
elif '0x0c2e' in get_brcd:
    brcd_model = 'HoneyWell/Metrologic'
    state_brcd.set(1)
elif '0x1eab' in get_brcd:
    brcd_model = 'NewLand'
    state_brcd.set(1)
elif '0x0536' in get_brcd:
    brcd_model = 'HoneyWell 4600g'
    state_brcd.set(1)
elif '0x2dd6' in get_brcd:
    brcd_model = 'Mertech'
    state_brcd.set(1)

get_tm = subprocess.check_output("lsusb -v | grep idVendor | grep -e '0x067b' -e '0xa420' | awk '{print $2}'", shell=True)
get_tm = str(get_tm, 'utf-8')
tm_model = 'Не определено. Не настроено'

state_tm = IntVar()
if '0x067b' in get_tm:
    tm_model = 'Aladdin'
    state_tm.set(1)
elif '0xa420' in get_tm:
    tm_model = 'InfoCrypt'
    state_tm.set(1)

get_pos = subprocess.check_output("lsusb -v | grep idVendor | grep -e '0x11ca' | awk '{print $2}'", shell=True)
get_pos = str(get_pos, 'utf-8')
pos_model = 'Не определено. Не настроено'

state_pos = IntVar()
if '0x11ca' in get_pos:
    pos_model = 'VeroFone VX820'
    state_pos.set(1)

get_mfu = subprocess.check_output("lpstat -v | grep 'socket://' | awk '{print $4$5$6}'", shell=True)
get_mfu = str(get_mfu, 'utf-8')
mfu_model = 'Не определено. Не настроено'
state_mfu = IntVar()

if 'Xerox' in get_mfu:
    mfu_model = 'Xerox'
    state_mfu.set(1)
elif 'Lexmark' in get_mfu:
    mfu_model = 'Lexmark'
    state_mfu.set(1)


get_webcam = subprocess.check_output("lsusb -v | grep idProduct | grep -e '0x082B' -e '0x0836' -e '0x2284' -e '0x0810' -e '0x0819' -e '0x0825' -e '0x3420' -e '0x6340' -e '0x2700' | awk '{print $2}'", shell=True)
get_webcam = str(get_webcam, 'utf-8')
webcam_model = 'Не определено. Не настроено'
state_webcam = IntVar()

if '0x082B' in get_webcam:
    webcam_model = 'Logitech C170'
    state_webcam.set(1)
elif '0x0836' in get_webcam:
    webcam_model = 'Logitech B525'
    state_webcam.set(1)
elif '0x0819' in get_webcam:
    webcam_model = 'Logitech C210'
    state_webcam.set(1)
elif '0x0825' in webcam_model:
    webcam_model = 'Logitech C270'
    state_webcam.set(1)
elif '0x2284' in get_webcam:
    webcam_model = 'KREZ CMR01'
    state_webcam.set(1)
elif '0x0810' in get_webcam:
    webcam_model = 'Microsoft LifeCam HD-3000'
    state_webcam.set(1)
elif '0x3420' in get_webcam:
    webcam_model = 'A4TECH PKS-730G'
    state_webcam.set(1)
elif '0x2700' in get_webcam:
    webcam_model = 'A4TECH PC Camera'
    state_webcam.set(1)
elif '0x6340' in get_webcam:
    webcam_model = 'Canyon CNE/CWC'
    state_webcam.set(1)

def save_btn():

    if fio_entry.get() == "":
        messagebox.showerror("Ошибка!", "Необходимо заполнить все поля!")
        exit ()
    elif zno_entry.get() == "":
        messagebox.showerror("Ошибка!", "Необходимо заполнить все поля!")
        exit ()
    else:
        with open ('1.log','a') as read:
                read.write("\n========START========")
        if state_wifi.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nWi-Fi:1')
        elif state_wifi.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nWi-Fi:0')
        if state_bankprinter.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nBankPrinter:1')
        elif state_bankprinter.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nBankPrinter:0')
        if state_brcd.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nBRCD:1')
        elif state_brcd.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nBRCD:0')
        if state_tm.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nTM:1')
        elif state_tm.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nTM:0')
        if state_pos.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nPOS:1')
        elif state_pos.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nPOS:0')
        if state_mfu.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nMFU:1')
        elif state_mfu.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nMFU:1')
        if state_webcam.get() == 1:
            with open ('1.log','a') as read:
                read.write('\nWebCam:1')
        elif state_webcam.get() == 0:
            with open ('1.log','a') as read:
                read.write('\nWebCam:0')
        logging.info("\n=========END=========")
        messagebox.showinfo("Информация", "Данные записаны.")
        exit()

class Device:
    def __init__(self,model):
        self.model = model
    
    def bank_printer():
        return "%s"%bp_model
    def brcd_reader():
        return "%s"%brcd_model
    def tm_reader():
        return "%s"%tm_model
    def pos_reader():
        return "%s"%pos_model
    def webcam():
        return "%s"%webcam_model
    def mfu():
        return "%s"%mfu_model

fio_label = Label(label1, text="ФИО инженера проводившего работы (например Иванов Иван Иванович)", font=20).pack()
fio_entry = Entry(label1,width=60, font=('TimesNewRoman 12'))
fio_entry.pack()
zno_label = Label(label1, text="Номер ЗНО (только цифры, например 123456789", font=20).pack()
zno_entry = Entry(label1,width=40, font=('TimesNewRoman 12'))
zno_entry.pack()
chk_wifi = Checkbutton(label1, text="Wi-Fi", var=state_wifi ,font=10).pack()
chk_bankprinter = Checkbutton(label1, text=f'Банковский принтер: {Device.bank_printer()}', var=state_bankprinter ,font=10).pack()
chk_tm = Checkbutton(label1, text=f'ТМ: {Device.tm_reader()}', var=state_tm, font=10).pack()
chk_brcd = Checkbutton(label1, text=f'Сканер ШК: {Device.brcd_reader()}', var=state_brcd, font=5).pack()
chk_pos = Checkbutton(label1, text=f'POS: {Device.pos_reader()}', var=state_pos, font=10).pack()
chk_mfu = Checkbutton(label1, text=f'МФУ: {Device.mfu()}', var=state_mfu, font=10).pack()
chk_webcam = Checkbutton(label1, text=f'Web-камера: {Device.webcam()}', var=state_webcam, font=10).pack()
btn_save = Button(label1, text='Save',command=save_btn, font=15)
btn_save.pack()
btn_exit = Button(label1, text='Выход', command=exit,font=15)
btn_exit.pack()
root.mainloop()

