FROM centos:6
MAINTAINER Pasi Lammi <pasi.lammi@iki.fi>

# download binaries from vmware.. https://my.vmware.com/group/vmware/details?downloadGroup=OVFTOOL410&productId=491
# rename bundle to ovftool.bin before run this dockerfile
RUN yum -y install tar
RUN mkdir /app 
ADD ovftool.bin /app/
RUN mv /bin/more /bin/more.bak
RUN ln -s /bin/cat /bin/more
WORKDIR /app
RUN (echo; echo yes; echo)|bash ./ovftool.bin ; rm -f ovftool.bin
RUN rm -f /bin/more
RUN mv /bin/more.bak /bin/more
VOLUME /app
CMD /bin/bash
