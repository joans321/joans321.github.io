---
layout: post
title: python 决策树算法
category: math
tags: [math, ai, python]
---

决策树是一个树状结构决策图，根据对象属性用概率统计的方式预测结果。

决策树的难点是在已有数据样本的情况下如何生成决策树，一旦生成之后就是根据属性做 `if-else` 判断出结果即可。

本文使用 scikit-learn 中的 iris 的鸢尾花数据集作为例子来学习决策树算法。

鸢尾花数据集是包含150个样本的三种不同种类的鸢尾花，每个鸢尾花有4个属性特征。

四个特征：花萼长度(cm),花萼宽度(cm),花瓣长度(cm),花瓣宽度(cm)

三种鸢尾花：山鸢尾花(Iris Setosa), 变色鸢尾花(Iris Versicolor), 维吉尼亚鸢尾花(Iris Virginica)

关于鸢尾花数据集的详细介绍参考这篇文章：[探索sklearn 鸢尾花数据集](http://www.cnblogs.com/meelo/p/4272036.html)



```python
from sklearn.datasets import load_iris

# 加载数据集
iris = load_iris()

# 数据特征：150行， 4列
feature = iris['data']

# 对应的鸢尾花种类: 150个，三种鸢尾花分别用 0,1,2 表示
target = iris['target']
```

在使用上述的鸢尾花数据样本生成决策树之前，我们需要先了解几个概念。

## 信息熵

在信息论中，熵是接收的每条消息中包含的信息的平均量，又称为信息熵。离散随机变量的熵 H 定义为：

$$
H(X) = -\sum_i^n p_i(x) \log_2 p_i(x)
$$

熵表示信息的不确定性，熵越大知道的信息就越少。关于熵的理论这里不做过多介绍，我们只通过例子来理解加深理解。

对于鸢尾花来说，随机抽出一个鸢尾花，它到底属于哪一种鸢尾花就是不确定的。

我们通过数据集可知道三种鸢尾花的数量，每种鸢尾花的概率就是数量除以总数（这里总数是 150）。


```python
import numpy as np


# 三种鸢尾花数量
iris_count = np.zeros(3)

iris_count[0] = target[target == 0].size
iris_count[1] = target[target == 1].size
iris_count[2] = target[target == 2].size

print("三种鸢尾花的数量分别为：", iris_count)

iris_probability = np.divide(iris_count, 150)

print("三种莺尾花的概率为：", iris_probability)

# 根据公式算出鸢尾花的熵：
iris_h = -np.sum(iris_probability * np.log2(iris_probability))

print("鸢尾花的熵为：", iris_h)

```

    三种鸢尾花的数量分别为： [50. 50. 50.]
    三种莺尾花的概率为： [0.33333333 0.33333333 0.33333333]
    鸢尾花的熵为： 1.584962500721156



在信息论中，熵的单位可以用 `bit` 表示。从上述结果可以看出，三种鸢尾花同等概率，熵为 1.5 bit。这跟我们程序设计时需要用多少位表示多少种状态的理论是类似的。

根据信息熵的数学公式，我们可以知道，所有概率 p(x) 都一样时熵（不确定性）最大。通俗点说就是，所有种类概率相等时，我们很难猜出一朵鸢尾花到底是哪一种。如果有一种鸢尾花的概率是百分之九十的话，我们不需要其他信息就可以猜出它属于那种花（不确定性相对较小）。

为了降低信息熵，我们需要引入更多的信息。决策树通过引入鸢尾花的属性（特征）的分类，来降低信息熵。

// TODO


