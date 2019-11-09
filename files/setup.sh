#!/bin/bash
if [ -z PYPI_DOMAIN -o -z PYPI_OPTION ];then
    if [ ! -f /root/.pip/pip.conf ];then
        mkdir -p /root/.pip/pip.conf
        echo "[global]" >> /root/.pip/pip.conf
        if [ -z PYPI_DOMAIN ];then
            echo "index-url=${PYPI_DOMAIN}" >> /root/.pip/pip.conf
        fi
        if [ -z PYPI_OPTION ];then
            echo "trusted-host=${PYPI_OPTION}" >> /root/.pip/pip.conf
        fi
    fi
fi
if [ ! -d /data/python3.7.5 ];then
    cp -r /home/python3.7.5 /data/
fi
if [ -f requirements.txt ];then
    /data/python3.7.5/bin/pip3 install -r requirements.txt
fi
exec /data/python3.7.5/bin/python3 "$@"
