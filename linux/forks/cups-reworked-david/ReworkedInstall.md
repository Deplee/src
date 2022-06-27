# -- This is for replacement installation -- #


# all commands needs to be executed as ROOT
tar xvf cups-david-reworked.tar.gz <ENTER>
cd cups-2.3.1/ <ENTER>
./configure <ENTER>
make <ENTER>
cd backend/ <ENTER>
make <ENTER>
make usb <ENTER>
make install <ENTER>
systemctl restart cups <ENTER>
reboot <ENTER>
