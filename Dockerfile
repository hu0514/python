From centos

RUN yum install gcc make zlib* wget vim openssl-devel libffi-devel -y \
    && cd /tmp \
    && mkdir -p /data/python3.7.5 \
    && wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz \
    && tar zxvf Python-3.7.5.tgz \
    && cd Python-3.7.5 \
    && ./configure --prefix=/data/python3.7.5 --enable-optimizations --with-ssl \
    && make \
    && make install \
    && cp -r /data/python3.7.5 /home/ \
    && yum clean all \
    && cd /tmp \
    && rm -rf /tmp/*
ADD ./files/setup.sh /tmp/setup.sh
RUN chmod 755 /tmp/setup.sh
ENTRYPOINT ["/tmp/setup.sh"]
CMD ["-v"]

