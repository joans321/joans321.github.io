---
layout: post
title: Docker环境安装
category: docker
tags: [docker, 记录]
---

## 准备

Docker对系统内核有要求, 内核版本最好是3.0之后的。Ubuntu版本14.04之后的都比较好安装。
{% highlight sh %}
$ uname  -a
Linux xue-Inspiron-7420 3.13.0-53-generic #89-Ubuntu SMP Wed May 20 10:34:39 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 14.04.2 LTS
Release:        14.04
Codename:       trusty
{% endhighlight %}



## 安装

{% highlight sh %}
sudo apt-get remove --purge docker.io docker  # 删除默认docker
$ wget -qO- https://get.docker.com/ | sh   # 参考官网安装手册
{% endhighlight %}

## 验证

{% highlight sh %}
$ sudo docker -d  # 启动docker服务
$ sudo docker run hello-world # 出现如下提示则安装成功
Hello from Docker.
{% endhighlight %}

> 参考 : https://docs.docker.com/installation/ubuntulinux/