---
layout: post
title: 线性代数笔记
category: math
tags: [math, ai]
---

# 向量点积和模长

向量的点积等于向量每个分量相乘之和，向量的模长等于向量与自身的点积求根号（二维向量空间的话符合勾股定理），记做 ：$\lvert \vec a \rvert = \sqrt{\vec a \cdot \vec a}$。

$$
\vec a \cdot \vec b = 
\begin{bmatrix}
  a_1 \\
  a_2 \\
  . \\
  . \\
  . \\
  a_n \\
\end{bmatrix}
\begin{bmatrix}
  b_1 \\
  b_2 \\
  . \\
  . \\
  . \\
  b_n \\
\end{bmatrix}
= a_1*b_1 + a_2*b_2 + ... + a_n*b_n
$$

点积的性质（根据定义推导）：

* 交换律： $\vec v \cdot \vec w = \vec w \cdot \vec v$
* 分配律： $(\vec v + \vec w) \cdot \vec x = \vec v \cdot \vec x + \vec w \cdot \vec x$
* 结合律： $(c \vec v) \cdot w = c (\vec v \cdot \vec w)$


# 不等式

* 非零向量不等式(等号成立的唯一条件是： $\vec x = c \vec y$)：

$$
\lvert \vec x \cdot \vec y \rvert \leq \left\lVert x \right\rVert \left\lVert y \right\rVert
$$

证明，令函数 $ p(t) = \left\lVert t \vec y - \vec x \right\rVert^2 \geq 0 $，则

$$
\begin{matrix}
p(t) & = & (t \vec y - \vec x) \cdot (t \vec y - \vec x) \\
     & = & t^2 \vec y \cdot \vec y - 2t \vec x \cdot \vec y + \vec x \cdot \vec x \\
\end{matrix}
$$

令 $a = \vec y \cdot \vec y$, $b = 2 \vec x \cdot \vec y$, $c = \vec x \cdot \vec x$，则 $p(t) = at^2+bt+c \geq 0$

再令 $t = \frac{b}{2a}$ ，则

$$
\begin{matrix}
p(\frac{b}{2a}) & = & a(\frac{b}{2a})^2 - b \frac{b}{2a} + c \\
 & = & \frac{b^2}{4a} - \frac{b^2}{2a} + c \\
 & = & - \frac{b^2}{4a} + c \\
 & \geq & 0 \\
\end{matrix}
$$

所以得到不等式 $4ac \geq b^2$，再还原得到:

$$
\begin{matrix}
4 (\vec y \cdot \vec y)(\vec x \cdot \vec x) & \geq & (2 \vec x \cdot \vec y)^2 \\
4 \left\lVert y \right\rVert^2 \left\lVert x \right\rVert^2 & \geq & 4 (\vec x \cdot \vec y)^2 \\
\left\lVert y \right\rVert \left\lVert x \right\rVert & \geq & \lvert \vec x \cdot \vec y \rvert \\
\end{matrix}
$$

* 三角不等式

$$
\begin{matrix}
\left\lVert \vec x + \vec y \right\rVert^2 & = & (\vec x + \vec y) \cdot (\vec x + \vec y) \\
    & = & \left\lVert \vec x \right\rVert^2 + 2 \vec x \cdot \vec y + \left\lVert \vec y \right\rVert^2 \\
    & \leq & \left\lVert \vec x \right\rVert^2 + 2 \left\lVert x \right\rVert \left\lVert y \right\rVert + \left\lVert \vec y \right\rVert^2 \\
    & \leq & (\left\lVert \vec x \right\rVert + \left\lVert \vec y \right\rVert)^2
\end{matrix}
$$

所以得到三角不等式（一个边长小于其他两边之和）：

$$
\left\lVert \vec x + \vec y \right\rVert \leq \left\lVert \vec x \right\rVert + \left\lVert \vec y \right\rVert
$$




# 向量夹角

余弦定理： $ C^2 = A^2 + B^2 + 2AB\cos\theta$

使用三角向量表示： 

$$
\left\lVert \vec a - \vec b \right\rVert^2 = \left\lVert \vec a \right\rVert^2 + \left\lVert \vec b \right\rVert^2 + 2 \left\lVert \vec a \right\rVert \left\lVert \vec b \right\rVert \cos\theta
$$

又因为：

$$
\left\lVert \vec a - \vec b \right\rVert^2 = (\vec a - \vec b)(\vec a - \vec b) = \left\lVert \vec a \right\rVert^2 + \left\lVert \vec b \right\rVert^2 - 2 \vec a \cdot \vec b
$$

得到： 

$$
2 \vec a \cdot \vec b = 2 \left\lVert \vec a \right\rVert \left\lVert \vec b \right\rVert \cos\theta
$$

把向量的夹角 $\theta$ 定义如下：

$$
\cos\theta = \frac{\vec a \cdot \vec b}{\left\lVert \vec a \right\rVert \left\lVert \vec b \right\rVert}
$$

两个向量夹角为零，称之为垂直（不包含零向量）。

两个向量点积为零，称之为正交（包含零向量）。


# 视频课程
1. [麻省理工公开课：线性代数](http://open.163.com/special/opencourse/daishu.html)
2. [可汗学院公开课：线性代数](http://open.163.com/special/Khan/linearalgebra.html)
