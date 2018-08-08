## vpn 搭建


准备一台国外VPS或阿里云esc(地址为大陆外)，然后使用root用户登录，指向以下命令

yum install -f wget 

wget --no-check-certificate https://raw.githubusercontent.com/wangyongbin/my/master/vpn/ssrmu.sh

chmod +x ssrmu.sh

./ssrmu.sh


![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v1.png)


如上图出现管理界面后，输入数字1来安装SSR服务端。如果输入1后不能进入下一步，那么请退出xshell，重新连接vps服务器，然后输入快捷管理命令bash ssr.sh 再尝试。

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v2.png)

根据上图提示，依次输入自己想设置的端口和密码 (密码建议用复杂点的字母组合，图中的密码只是作为演示用)，回车键用于确认

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v3.png)

如上图，选择想设置的加密方式，比如10，按回车键确认

接下来是选择协议插件，如下图：

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v4.png)

选择并确认后，会出现上图的界面，提示你是否选择兼容原版，这里的原版指的是SS客户端，可以根据需求进行选择，原则上不推荐使用SS客户端，演示选择n

之后进行混淆插件的设置，如下面

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v5.png)

进行混淆插件的设置后，会依次提示你对设备数、单线程限速和端口总限速进行设置，默认值是不进行限制，个人使用的话，选择默认即可，即直接敲回车键。

之后代码就正式自动部署了，到下图所示的位置，提示你下载文件，输入：y

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v6.png)

耐心等待一会，出现下面的界面即部署完成：

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v7.png)

根据上图就可以看到自己设置的SSR账号信息，包括IP、端口、密码、加密方式、协议插件、混淆插件。如果之后想修改账号信息，直接输入快捷管理命令：bash ssr.sh 进入管理界面，选择相应的数字来进行一键修改。例如：

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/v8.png)

结果：
用户 [wyb] 的配置信息：

 I  P       : xxx.xxx.xxx.xxx <br/>
 端口       : 16899  <br/>
 密码       : wyb.com <br/>
 加密       : aes-128-ctr <br/>
 协议       : auth_sha1_v4_compatible <br/>
 混淆       : tls1.2_ticket_auth_compatible <br/>
 设备数限制 : 0(无限) <br/>
 单线程限速 : 0 KB/S <br/>
 用户总限速 : 0 KB/S <br/>
 禁止的端口 : 无限制 <br/>

 已使用流量 : 上传: 0 B + 下载: 0 B = 0 B <br/>
 剩余的流量 : 819.21 TB <br/>
 用户总流量 : 819.21 TB <br/>
 SS    链接 : ss://YWVzLTEyOC1jdHI6d3liLmNvbUA0Ny43NS4xMTkuMjE2OjE2ODk5 <br/>
 SS  二维码 : https://makeai.cn/qr/?m=2&e=H&p=3&url=ss://YWVzLTEyOC1jdHI6d3liLmNvbUA0Ny43NS4xMTkuMjE2OjE2ODk5 <br/>
 SSR   链接 : ssr://NDcuNzUuMTE5LjIxNjoxNjg5OTphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6dGxzMS4yX3RpY2tldF9hdXRoOmQzbGlMbU52YlE <br/>
 SSR 二维码 : https://makeai.cn/qr/?m=2&e=H&p=3&url=ssr://NDcuNzUuMTE5LjIxNjoxNjg5OTphdXRoX3NoYTFfdjQ6YWVzLTEyOC1jdHI6dGxzMS4yX3RpY2tldF9hdXRoOmQzbGlMbU52YlE <br/>

  提示: <br/>
 在浏览器中，打开二维码链接，就可以看到二维码图片。 <br/>
 协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。 <br/>
 


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
