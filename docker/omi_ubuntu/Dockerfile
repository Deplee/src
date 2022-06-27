FROM ubuntu:20.04

ENV TZ=Asia/Krasnoyarsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /home/OMI

COPY  main_omi/ .

RUN tar xvf omi-1.6.8-1.tar.gz \
		&& apt update && apt upgrade -y \ 
		&& apt install git pkg-config make g++ -y \
		&& apt install rpm librpm-dev libpam0g-dev -y \
		&& apt install libssl-dev libkrb5-dev gawk -y \
		&& /home/OMI/omi-1.6.8-1/Unix/configure --prefix=/opt/omi --bindir=/usr/local/bin \
		&& cd /home/OMI/omi-1.6.8-1
RUN make && make install \
		&& dpkg -i omi-1.6.8-1.ssl_110.ulinux.x64.deb \
		&& rm -rf /home/OMI/*

CMD service omid start && /opt/omi/bin/omicli ei root/omi OMI_Identify
