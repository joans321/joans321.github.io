---
layout: post
title: matplotlib 中文显示
category: python
tags: [matplotlib, python]
---



### 系统环境

* ubuntu/macos
* pyenv 和 virtualenv




## 显示配置

修改 `~/.matplotlibrc` 配置文件（对于macos来说是 `~/.matplotlib/matplotlibrc` 文件）

~~~sh
# macos 修改如下即可解决加载 _macosx 模块错误：
#       **RuntimeError**: Python is not installed as a framework
backend: TkAgg

# 如果使用 QT5 的话配置如下
# backend: Qt5Agg
~~~

其他后端支持参考官网 `Backends` 章节：[Matplotlib Backends](https://matplotlib.org/tutorials/introductory/usage.html#backends)






### 中文支持

* 拷贝 `SimHei` 字体文件到 matplotlib 字体目录下，`SimHei` 字体来源如下：
  1. Windows 系统的字体文件夹下面拷贝
  2. 点击这里[下载](https://github.com/joans321/joans321.github.io/blob/master/assets/download/SimHei.ttf)
  3. Linux/Mac 系统通过 `fc-list | grep -i SimHei` 命令查看系统是否已经安装该字体

~~~Sh
# 拷贝 SimHei.ttf 字体文件到 matplotlib 安装目录
# 本文使用的是 pyenv 虚拟环境安装的, 读者要根据具体情况修改路径
$ cp SimHei.ttf ~/.pyenv/versions/venv347/lib/python3.4/site-packages/matplotlib/mpl-data/fonts/ttf/
~~~



* 修改 `~/.matplotlibrc` 配置文件（对于macos来说是 `~/.matplotlib/matplotlibrc` 文件）

~~~tex
font.family         : sans-serif

font.serif          : SimHei, DejaVu Serif, Bitstream Vera Serif, New Century Schoolbook, Century Schoolbook L, Utopia, ITC Bookman, Bookman, Nimbus Roman No9 L, Times New Roman, Times, Palatino, Charter, serif

font.sans-serif     : SimHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
~~~



* 删除缓存文件

~~~sh
# for ubuntu
$ rm -rf ~/.cache/matplotlib/

# for macos
$ rm -rf ~/.matplotlib/fontList.json 
$ rm -rf ~/.matplotlib/tex.cache/
~~~



* 重新启动 python 即可让 matplotlib 支持中文



* 启动 python 检查是否配置成功

~~~sh
>>> import matplotlib.pyplot as plt

# 查看该字体第一个是不是 SimHei
>>> plt.rcParams['font.sans-serif']
['SimHei', 'DejaVu Sans', 'Bitstream Vera Sans', 'Lucida Grande', 'Verdana', 'Geneva', 'Lucid', 'Arial', 'Helvetica', 'Avant Garde', 'sans-serif']
~~~





参考：[机器学习 Python 环境搭建](/2018/03/03/ai-setup)