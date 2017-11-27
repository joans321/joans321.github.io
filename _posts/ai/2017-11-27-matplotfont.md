---
layout: post
title: matplotlib 支持中文
category: python
tags: [matplotlib, python]
---



### 系统环境

* ubuntu
* python 3.4
* matplotlib 使用 Qt5



### 操作步骤

* 拷贝字体文件到 matplotlib 字体目录下

~~~tex
# 查看系统是否有 SimHei 字体，如果没有则从 windows 系统下拷贝 simhei.ttf 这个字体文件

$ fc-list | grep -i SimHei
/usr/share/fonts/winfont/simhei.ttf: 黑体,SimHei:style=Regular,Normal,obyčejné,Standard,Κανονικά,Normaali,Normál,Normale,Standaard,Normalny,Обычный,Normálne,Navadno,Arrunta

$ cp /usr/share/fonts/winfont/simhei.ttf /home/joans/.pyenv/versions/venv347/lib/python3.4/site-packages/matplotlib/mpl-data/fonts/ttf/
~~~



* 修改 ~/.matplotlibrc 配置文件

~~~tex
font.family         : sans-serif

font.serif          : SimHei, DejaVu Serif, Bitstream Vera Serif, New Century Schoolbook, Century Schoolbook L, Utopia, ITC Bookman, Bookman, Nimbus Roman No9 L, Times New Roman, Times, Palatino, Charter, serif

font.sans-serif     : SimHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
~~~



* 删除缓存文件

~~~tex
rm -rf ~/.cache/matplotlib/
~~~



* 重新启动 python 即可让 matplotlib 支持中文