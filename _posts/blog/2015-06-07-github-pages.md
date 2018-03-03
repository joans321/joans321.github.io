---
layout: post
title: 博客搭建
category: how2blog
tags: [github, jekyll, markdown, emacs]
---

#  博客介绍

本博客是基于 github page 的 jekyll 服务搭建，可自备服务器搭建博客也可挂在 github 上面。

jekyll 是基于 ruby 的静态内容服务器，支持把 markdown 格式的文档自动转成 html 的静态网页。

本博客中相关数学公式以及流程图使用纯 `javascript` 方式渲染，可参考文章：

* [Github 博客画流程图](/2017/11/09/mermaid-flow)
* [Markdown 数学公式](/2017/11/01/formula)



## Jekyll 环境搭建

~~~Sh
# 安装 rvm 管理 ruby 版本
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ curl -sSL https://get.rvm.io | bash -s stable --ruby

# 安装 bundle 
$ gem install bundle

# 运行博客服务
$ cd [blog-directory]
$ bundle install
$ bundle exec jekyll server
~~~

`注：macos 需要先执行 brew install gnupg 命令`



# 学习内容列表

* [jekyll 学习](/2015/06/07/jekyll-study)
* [如何写一篇好的技术博客](http://rock3.info/blog/2013/11/26/%E5%A6%82%E4%BD%95%E5%86%99%E4%B8%80%E7%AF%87%E5%A5%BD%E7%9A%84%E6%8A%80%E6%9C%AF%E5%8D%9A%E5%AE%A2/)
* [一步步在GitHub上创建博客主页](http://www.pchou.info/web-build/2013/01/03/build-github-blog-page-01.html)
* [MakrDown语法](http://www.ituring.com.cn/article/775)
* 学习使用 google 站内搜索功能
* 学习使用 google 网站分析功能
* 学习Emacs编辑器
* [Emacs归来记](http://blog.jamespan.me/2015/04/05/the-return-of-the-emacs)
