---
layout: page
title: Joans Blog
tagline: 书山有路勤为径，学海无涯苦作舟
---
{% include JB/setup %}

## 博客列表

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo;
      <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>