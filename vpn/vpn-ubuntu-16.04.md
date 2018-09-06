
 
### Ubuntu16.04 配置 shadowsocks客户端
使用 pip 安装很简单

```aidl

sudo apt-get update
sudo apt-get install -y python-pip
sudo apt-get install -y python-setuptools m2crypto

```

接着安装shadowsocks

```
pip install shadowsocks
sudo apt-get install -y shadowsocks

```

安装好后，在本地我们要用到sslocal ，终端输入sslocal --help 可以查看帮助，像这样

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/vu1.png)

通过帮助提示我们知道各个参数怎么配置，比如 sslocal -d start -c 后面加上我们的json配置文件，或者像下面这样直接命令参数写上运行。

比如：

> sudo sslocal -d start -s 123.123.123.123 -p 5001 -k “123456” -l 1080 -t 600 -m aes-256-cfb

* -d start/stop/restart 以守护服务模式运行 
* -s 表示服务ip地址
* -p 指的是服务端的端口 
* -l 是本地端口默认是1080
* -k ss服务器密码（要加”“）
* -t 超时默认300
* -m 是加密方法默认aes-256-cfb

为了方便可以直接用sslcoal -d start -c 配置文件路径这样的方式只需配置一次，简单好用。

我们可以在/home/sa/ 下新建个文件shadowsocks.json  (sa 是我在我电脑上的用户名，这里路径你自己看你的)。
内容如下：

```aidl

{
"server":"123.123.123.1234",
"server_port":5001,
"local_port":1080,
"password":"123456",
"timeout":600,
"method":"aes-256-cfb"
}

```

* server  表示服务ip地址
* servier_port  指的是服务端的端口 
* local_port  是本地端口默认是1080
* password  ss服务端设置的密码
* timeout  超时设置和服务端一样
* method  加密方法和服务端一样

确定上面的配置文件没有问题，然后我们就可以在终端输入 sudo sslocal -d start -c /home/sa/shadowsocks.json 回车运行即可


### 使用系统代理，生成pac文件然后配置ubuntu16.04的网络代理

安装 genpac

```aidl

sudo pip install genpac

```

生成pac文件

> genpac --pac-proxy "SOCKS5 127.0.0.1:1080" --output="autoproxy.pac"

配置系统网络代理，如下

> 系统设置 -> 网络 -> 网络代理

![image](https://raw.githubusercontent.com/wangyongbin/my/master/vpn/images/vu2.png)


### 参考：
* [Chrome扩展程序crx的下载和安装方法](https://jingyan.baidu.com/article/e4511cf35c2df92b845eafb3.html)
* [SwitchyOmega插件](https://github.com/FelisCatus/SwitchyOmega/releases)
* [Ubuntu 16.04使用Shadowsocks代理上网(Chrome浏览器)](https://blog.csdn.net/u79501/article/details/69666754?readlog)
* [ubuntu16.04下shadowsocks配置(火狐浏览器)](https://blog.csdn.net/weixin_40320794/article/details/79287287)
* [Ubuntu16.04下配置shadowsocks（亲测可用）](https://blog.csdn.net/mynameis121/article/details/70191057)
