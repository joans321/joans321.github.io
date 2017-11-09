---
layout: post
title: Github 博客画流程图
category: how2blog
tags: [tools, study， markdown]
description: 文章描述测试
mermaid: true
---



由于 github page 默认不支持流程图工具，所以得使用脚本渲染的方式来支持。

使用 [Mermaid](https://mermaidjs.github.io/) 工具可以让用户以类似 markdown 文本的方式创建流程图和框图。

举个例子，使用下面的 Mermaid 格式的文本将画出流程图：

~~~mermaid
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
~~~

<div class="mermaid">

graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;

</div>



## 支持 Mermaid 步骤

* 在 html 主题模板文件的头部加入以下内容加载 mermaid 脚本（如果文章的 mermaid 配置项打开脚本加载）：

~~~sh
{\% if page.mermaid \%}
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/7.1.0/mermaid.min.js"></script>
    <script>
        var config = {
            startOnLoad:true,
            flowchart:{
                useMaxWidth:false,
                htmlLabels:true
            }
        };
        mermaid.initialize(config);
    </script>
{\% endif \%}
~~~

**注意: 上文中 {\%  \%} 需要把 \\ 去掉，因为写文章不加 \\ 的话这句话就被 jekyll 当做语法使用了**

* 在文章的开头配置（需要画流程图的文章加上此配置项）

~~~tex
mermaid: true
~~~

* 在文章画图的地方定义流程图，如下所示

~~~tex
<div class="mermaid">
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
</div>
~~~

把流程图代码放在 `<div class="mermaid"> </div>`  里边，Mermaid 脚本就会渲染变成流程图展现给用户。

本博客就是使用 mermaid 画的流程图，有兴趣的同学可以直接右键查看页面源码作为例子参考。



## 链接

* [Mermaid 使用文档](https://mermaidjs.github.io/)
* [Mermaid 在线编辑器](https://mermaidjs.github.io/mermaid-live-editor)
* [github page markdown 在线编辑器](https://jbt.github.io/markdown-editor)
* [Mermaid 简介](http://blog.csdn.net/wangyaninglm/article/details/52887045)

