---
layout: post
title: Android环境搭建
category: Android
tags: [Android, 记录]
---

## Android工具链生成

{% highlight sh %}
cd $NDK_HOME;
./build/tools/make-standalone-toolchain.sh  --platform=android-8 --system=linux-x86_64
{%endhighlight %}

{% highlight java %}
public class Hello {
       public static void main(String[] args) {
         system.out.println("Hello world!");
       }
}
{% endhighlight %}


