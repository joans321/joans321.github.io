---
layout: post
title: Android环境搭建
category: android
tags: [android, 记录]
---

## 工具列表

Android相关工具可以从服务器获取 : ftp://192.168.40.25/tools

* android-ndk-r8e
* android-sdk (23版本)
* arm-linux-androideabi-gcc (ndk-r8e生成)
* apache-ant-1.9.2
* apache-maven-3.2.2
* gradle-2.3
* jdk1.6.0_34
* swig-2.0.10

## Android工具链生成

{% highlight sh %}
cd $NDK_HOME;
./build/tools/make-standalone-toolchain.sh  --platform=android-8 --system=linux-x86_64
{%endhighlight %}

## 环境变量设置

```sh
### jdk
export JAVA_HOME=/opt/android/jdk1.6.0_34
export JDK_HOME=$JAVA_HOME
export JRE_HOME=$JAVA_HOME/jre
export PATH=$JDK_HOME/bin:$JRE_HOME/bin:$PATH

### gradle
export GRADLE_HOME=/opt/android/gradle-2.3
export PATH=$GRADLE_HOME/bin:$PATH

### ant
export ANT_HOME=/opt/android/apache-ant-1.9.2
export PATH=$ANT_HOME/bin:$PATH

### ndk
export ANDROID_NDK_HOME=/opt/android/android-ndk-r8e
export ANDROID_NDK=$ANDROID_NDK_HOME
export PATH=$ANDROID_NDK:$ANDROID_NDK/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86_64/bin:$PATH

### sdk
export ANDROID_SDK_HOME=/opt/android/android-sdks
export ANDROID_HOME=$ANDROID_SDK_HOME
export ANDROID_SDK=$ANDROID_SDK_HOME
export PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH
```



