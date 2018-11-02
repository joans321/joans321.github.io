---
layout: post
title: python 单例模式
category: python
tags: [python]
---

# Python 单例实现方法

python 实现单例方法有多种，下面我们介绍几种常用的方法。


## 1. 使用元类实现单例

* 创建一个 SingleInstance 的元类
* 类指定 metaclass = SingleInstance


```python
# 创建一个 metaclass 类
class SingleInstance(type):
    """
    类创建对象的时候会调用该方法, 返回类对象实例
    """
    def __call__(cls, *args, **kwargs):
        instance = getattr(cls, '__instance__', None)
        
        if instance is None:
            instance = super(SingleInstance, cls).__call__(*args, **kwargs)
            setattr(cls, '__instance__', instance)
            print("create instance ", instance)
        else:
            print("use old instance ", instance)
        print('got instance for ', cls)
        return instance


"""
测试方法：
1. 每次实验创建两个类，确认不同的类之间不会相互影响
2. 每个类创建两个对象，确认两个对象是一样的
"""
class TestClass0(metaclass=SingleInstance):
    def __init__(self):
        print("init test0 class object")


class TestClass1(metaclass=SingleInstance):
    def __init__(self):
        print("init test1 class object")
        

# 测试第一个类对象
test00 = TestClass0()
test01 = TestClass0()
print(test00, test01)

print('\n----------------------\n')

# 测试第二个类对象
test10 = TestClass1()
test11 = TestClass1()
print(test10, test11)
```

    init test0 class object
    create instance  <__main__.TestClass0 object at 0x7f5492fe66a0>
    got instance for  <class '__main__.TestClass0'>
    use old instance  <__main__.TestClass0 object at 0x7f5492fe66a0>
    got instance for  <class '__main__.TestClass0'>
    <__main__.TestClass0 object at 0x7f5492fe66a0> <__main__.TestClass0 object at 0x7f5492fe66a0>
    
    ----------------------
    
    init test1 class object
    create instance  <__main__.TestClass1 object at 0x7f5492fe69b0>
    got instance for  <class '__main__.TestClass1'>
    use old instance  <__main__.TestClass1 object at 0x7f5492fe69b0>
    got instance for  <class '__main__.TestClass1'>
    <__main__.TestClass1 object at 0x7f5492fe69b0> <__main__.TestClass1 object at 0x7f5492fe69b0>


## 2. 通过类的 new 方法实现

* 第一次创建对象并保存到类属性中
* 后续从类属性中取出对象，不再创建新的对象


```python
class SingleClass():
    def __new__(cls, *args, **kwargs):
        print('new instance for ', cls)
        
        if not hasattr(cls, '__instance__'):
            print('create instance for ', cls)
            instance = super(SingleClass, cls).__new__(cls, *args, **kwargs)
            cls.__instance__ = instance
        
        return cls.__instance__


class SubClass(SingleClass):
    pass

test00 = SingleClass()
test01 = SingleClass()
print(test00, test01)

print('\n----------------------\n')

test10 = SubClass()
test11 = SubClass()
print(test10, test11)


```

    new instance for  <class '__main__.SingleClass'>
    create instance for  <class '__main__.SingleClass'>
    new instance for  <class '__main__.SingleClass'>
    <__main__.SingleClass object at 0x7f5492fc75f8> <__main__.SingleClass object at 0x7f5492fc75f8>
    
    ----------------------
    
    new instance for  <class '__main__.SubClass'>
    new instance for  <class '__main__.SubClass'>
    <__main__.SingleClass object at 0x7f5492fc75f8> <__main__.SingleClass object at 0x7f5492fc75f8>


我们发现这样实现是有问题的，SubClass 无法创建自己的单例。
因为父类 SingleClass 的类对象数据会被所有子类共享，导致所有 SingleClass 子类无法创建新的对象。

解决方法是我们在 SingleClass 类中使用字典保存每个子类的实例对象，改进后代码如下：


```python
class SingleTClass():
    __instance__ = {}
    
    def __new__(cls, *args, **kwargs):
        print('new instance for ', cls)
        
        if not cls in cls.__instance__:
            print('create instance for ', cls)
            instance = super(SingleTClass, cls).__new__(cls, *args, **kwargs)
            cls.__instance__[cls] = instance

        return cls.__instance__[cls]


class SubTClass(SingleTClass):
    pass

test00 = SingleTClass()
test01 = SingleTClass()
print(test00, test01)

print('\n----------------------\n')

test10 = SubTClass()
test11 = SubTClass()
print(test10, test11)
```

    new instance for  <class '__main__.SingleTClass'>
    create instance for  <class '__main__.SingleTClass'>
    new instance for  <class '__main__.SingleTClass'>
    <__main__.SingleTClass object at 0x7f5492fc7ac8> <__main__.SingleTClass object at 0x7f5492fc7ac8>
    
    ----------------------
    
    new instance for  <class '__main__.SubTClass'>
    create instance for  <class '__main__.SubTClass'>
    new instance for  <class '__main__.SubTClass'>
    <__main__.SubTClass object at 0x7f5492fc7438> <__main__.SubTClass object at 0x7f5492fc7438>


## 3. 通过装饰器实现单例

* 创建一个 singleclass 的装饰器
* 创建类的时候使用上述装饰器


```python
from functools import wraps

"""
把类对象变成一个函数，每次调用类对象创建实例的时候，实际是调用装饰器返回的函数
"""
def singleclass(cls):
    __instance__ = {}
    
    @wraps(cls)
    def cls_instance(*args, **kwargs):
        print('new instance for ', cls)
        if not cls in __instance__:
            __instance__[cls] = cls(*args, **kwargs)
        return __instance__[cls]

    return cls_instance

@singleclass
class TestD1Class():
    pass

@singleclass
class TestD2Class():
    pass



test00 = TestD1Class()
test01 = TestD1Class()
print(test00, test01)

print('\n----------------------\n')

test10 = TestD2Class()
test11 = TestD2Class()
print(test10, test11)
```

    new instance for  <class '__main__.TestD1Class'>
    new instance for  <class '__main__.TestD1Class'>
    <__main__.TestD1Class object at 0x7f5492fee518> <__main__.TestD1Class object at 0x7f5492fee518>
    
    ----------------------
    
    new instance for  <class '__main__.TestD2Class'>
    new instance for  <class '__main__.TestD2Class'>
    <__main__.TestD2Class object at 0x7f5492fee160> <__main__.TestD2Class object at 0x7f5492fee160>

