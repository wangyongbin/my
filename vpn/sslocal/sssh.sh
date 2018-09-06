#!/bin/bash

#后台启动sslocal服务，并将全部日志输出道空设备，不保留日志
nohup sslocal -c /home/sa/work/vpn/shadowsocks.json >/dev/null 2>&1 &