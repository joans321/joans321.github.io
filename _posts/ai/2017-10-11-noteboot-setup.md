---
layout: post
title: notebook安装
category: ai
tags: notebook
---


## 安装环境

* Ubuntu 14.04 
* 64 bits cpu



## 安装步骤

* 系统应用安装

~~~sh
$ sudo apt-get install pandoc
~~~



- python应用安装

```sh
$ pip install ipython
$ pip install jupyter
```

本博客使用 `Jekyll` 静态网页，不支持 `notebook` 的 `.ipynb` 格式，需要手动执行脚本将其转换成 `markdown` 格式，脚本地址为：[notebook-to-md.sh](https://github.com/joans321/joans321.github.io/blob/master/notebook-to-md.sh)



## 软件配置

使用 `jupyter-notebook --generate-config` 生成配置文件，然后修改配置：

配置项参考官网介绍：http://jupyter-notebook.readthedocs.io/en/stable/config.html



## ipynb转pdf

~~~sh
# 直接转 pdf
$ jupyter-nbconvert --to pdf test.ipynb


### 如果直接转出错的话，先转 latex 再通过 texlive 转 pdf
### 两个步骤有助于定位转换错误问题

# 转 latex, 输出 test.tex
$ jupyter-nbconvert --to latex test.ipynb

# 把 test.tex 专程 test.pdf
$ xelatex test.tex

~~~



## 中文支持

### 手动支持

* 通过命令先生成 latex 文件，然后修改`\documentclass{article}` 为 `\documentclass{ctexart}`


* 通过 xelatex 把 latex 文件转成 pdf 格式

### 自动支持

* 修改模板文件: lib/python3.4/site-packages/nbconvert/templates/latex/article.tplx

~~~sh
# 文件中 article 更改为 ctexart 即可。
~~~

参考： https://github.com/yangsan/ipynbctexarttemplate



## texlive镜像安装

```sh
$ sudo apt-get purge tex-common
$ sudo apt-get install perl-tk

## 智慧科技 ftp 服务器: ftp://git.zhkj-rd.cn/iso/
## 清华大学镜像服务器: https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/
## USTC镜像服务器: http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/
## 官方安装 : https://ctan.org/mirrors
$ sudo mount -o loop texlive2017-20170524.iso /mnt
$ cd /mnt
$ sudo ./install-tl
## 提示时输入命令: I  -- <I> start installation to hard disk
## 等待几分钟就安装完毕
```

- 修改环境变量 `~/.bashrc`

```sh
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info:$INFOPATH
```

- 更新 texlive

```sh
## 需要先修改 texlive 文件夹的用户，避免操作无写权限
$ sudo chown <user> -R /usr/local/texlive

## 增加远端仓库, 阿里云: http://mirrors.aliyun.com/CTAN/systems/texlive/tlnet
$ tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet

## 先更新管理器
$ tlmgr update --self

## 更新所有包
$ tlmgr update --all
```





## texlive安装（兼容性差）

不建议使用这种方式安装，不同ubuntu版本差异较大。

```sh
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-xetex
sudo apt-get install latex-cjk-chinese
sudo apt-get install texlive-lang-cjk
```



## 过程出错

* tex 格式转换成 pdf 格式出错

执行 `xelatex  test.tex` 生成 pdf 命令，提示如下错误：

```tex
kpathsea: Running mktexmf ecrm1095
! I can't find file `ecrm1095'.
<*> ...ljfour; mag:=1; nonstopmode; input ecrm1095
                                                  
Please type another input file name
! Emergency stop.
<*> ...ljfour; mag:=1; nonstopmode; input ecrm1095
                                                  
Transcript written on mfput.log.
```

由于 texlive 缺少字体导致，安装 texlive 字体：

`sudo apt-get install texlive-fonts-recommended`



* 中文支持

~~~sh
! LaTeX Error: File `ctexart.cls' not found.
~~~

需要安装 texlive-lang-cjk 语言包支持。

`sudo apt-get install texlive-lang-cjk`



* 字体支持

~~~sh
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! fontspec error: "font-not-found"
! 
! The font "SimSun" cannot be found.
! 
! See the fontspec documentation for further information.
! 
! For immediate help type H <return>.
!...............................................  
                                                  
l.5   {SimSun}
~~~

由于默认使用windows字体，所以 ubuntu 下出现找不到字体 `SimSun` ，更换字体。

~~~sh
## 安装字体管理器
$ sudo apt-get install font-manager`

## 通过 font-manager 安装 C://WINDOWS/Fonts/sim*.ttf 字体
$ font-manager

## 查看字体是否安装成功
$ fc-list :lang=zh | grep -i simkai

## 修改 ctex 配置
$ cd /usr/share/texlive/texmf-dist/tex/latex/ctex/fontset
$ sudo sed -i 's/SIMKAI/KaiTi/g' ctex-xecjk-winfonts.def
~~~

