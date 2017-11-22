---
layout: post
title: Github 博客画流程图
category: how2blog
tags: [tools, study, markdown]
description: 文章描述测试
mermaid: true
---



由于 github page 默认不支持流程图工具，所以得使用脚本渲染的方式来支持。

使用 [Mermaid](https://mermaidjs.github.io/) 工具可以让用户以类似 markdown 文本的方式创建流程图和框图。

举个例子，使用下面的 Mermaid 格式的文本将画出流程图：

~~~tex
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
~~~

~~~mermaid
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
~~~





## 使用 Mermaid 方法

为了加速网页访问速度，我们只在有需要画流程图的文章中添加 mermaid 脚本支持。

- 在文章的开头配置

```tex
mermaid: true

例如本篇文章的配置：

---
layout: post
title: Github 博客画流程图
category: how2blog
tags: [tools, study, markdown]
mermaid: true
---
```

* 流程图使用以下语句( 使用 typera 编辑器支持 mermaid 语法)

~~~tex
​```mermaid
画图语句...
​```
~~~

Mermaid 语法使用参考[这篇文章](http://blog.lisp4fun.com/2017/11/21/mermaiduse)



## 支持 Mermaid 方法

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
            $(function(){
                var elements = document.getElementsByClassName("language-mermaid");
                for (var i = elements.length; i--;) {
                    element = elements[i];
                    var graphDefinition = element.innerText;
                    if (graphDefinition) {
                        var svg = mermaid.render('ha_mermaid_' + i, graphDefinition, function(svg){});
                        if (svg) {
                            var svgElement = document.createElement('div');
                            preNode = element.parentNode;
                            svgElement.innerHTML = svg;
                            svgElement.setAttribute('class', 'mermaid');
                            svgElement.setAttribute('data-processed', 'true');
                            preNode.parentNode.replaceChild(svgElement, preNode);
                        }
                    }
                }
            });
        </script>
{\% endif \%}
~~~

**注意: 上文中 {\%  \%} 需要把 \\ 去掉，因为写文章不加 \\ 的话这句话就被 jekyll 当做语法使用了**

本博客是在 _includes/themes/twitter/default.html 文件增加以上内容。

本博客使用 mermaid 画的流程图，有兴趣的同学可以直接右键查看页面源码作为例子参考。



## 链接

* [Mermaid 使用文档](https://mermaidjs.github.io/)
* [Mermaid 在线编辑器](https://mermaidjs.github.io/mermaid-live-editor)
* [github page markdown 在线编辑器](https://jbt.github.io/markdown-editor)
* [Mermaid 简介](http://blog.csdn.net/wangyaninglm/article/details/52887045)

