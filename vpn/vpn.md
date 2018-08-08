## vpn 搭建

./ssrmu.sh

<pre>

yum install -f wget 

wget --no-check-certificate https://raw.githubusercontent.com/wangyongbin/my/master/vpn/ssrmu.sh

chmod +x ssrmu.sh

./ssrmu.sh


结果：
用户 [wyb] 的配置信息：

 I  P       : xxx.xxx.xxx.xxx
 端口       : 16899 
 密码       : wyb.com
 加密       : aes-128-ctr
 协议       : auth_sha1_v4_compatible
 混淆       : tls1.2_ticket_auth_compatible
 设备数限制 : 0(无限)
 单线程限速 : 0 KB/S
 用户总限速 : 0 KB/S
 禁止的端口 : 无限制

 已使用流量 : 上传: 0 B + 下载: 0 B = 0 B
 剩余的流量 : 819.21 TB
 用户总流量 : 819.21 TB
 SS    链接 : ss://YWVzLTEyOC1jdHI6d3liLmNvbUA0Ny43NS4xMTkuMjE2OjE2ODk5
 SS  二维码 : https://makeai.cn/qr/?m=2&e=H&p=3&url=ss://YWVzLTEyOC1jdHI6d3liLmNvbUA0Ny43NS4xMTkuMjE2OjE2ODk5
 SSR   链接 : ssr://NDcuNzUuMTE5LjIxNjoxNjg5OTphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6dGxzMS4yX3RpY2tldF9hdXRoOmQzbGlMbU52YlE
 SSR 二维码 : https://makeai.cn/qr/?m=2&e=H&p=3&url=ssr://NDcuNzUuMTE5LjIxNjoxNjg5OTphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6dGxzMS4yX3RpY2tldF9hdXRoOmQzbGlMbU52YlE

  提示:
 在浏览器中，打开二维码链接，就可以看到二维码图片。
 协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。
 
 </pre>


## Google bbr 加速

<pre>
使用root用户登录，运行以下命令：
yum install -f wget 

wget --no-check-certificate https://raw.githubusercontent.com/wangyongbin/my/master/vpn/bbr.sh

chmod +x bbr.sh

./bbr.sh

安装完成后，脚本会提示需要重启 VPS，输入 y 并回车后重启。 
重启完成后，进入 VPS，验证一下是否成功安装最新内核并开启 TCP BBR，输入以下命令：

uname -r
查看内核版本，含有 4.9 就表示 OK 了

sysctl net.ipv4.tcp_available_congestion_control

返回值一般为： 
net.ipv4.tcp_available_congestion_control = bbr cubic reno

sysctl net.ipv4.tcp_congestion_control
返回值一般为： 
net.ipv4.tcp_congestion_control = bbr

sysctl net.core.default_qdisc
返回值一般为： 
net.core.default_qdisc = fq

lsmod | grep bbr
返回值有 tcp_bbr 模块即说明bbr已启动。

</pre>
