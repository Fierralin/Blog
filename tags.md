---
layout: page
title: Tags 

---

<div class="page-content wc-container">
  <div class="post">
    <h1>Tags</h1>  
	{% for tag in site.tags %}
	  <a href="{{site.baseurl}}/tag/{{ tag[0] }}">
	    <h2 id="{{ tag[0] | slugify }}">
            {{ tag[0] }}
            </h2>
	  </a>
	<ul>
		{% for post in site.posts %}
		 {% if post.tags contains tag[0] %}
		  <li>
		   <a href="{{post.url | prepend: site.baseurl}}">{{ post.title }}, {{ post.date | date_to_string }}</a>
		   {% for tagg in post.tags %}
		    <a href="#{{ tagg[0] | slugify }}">{{ tagg[0] }}</a>
		   {% endfor %}
		  </li>
		 {% endif %}
		{% endfor %}
	</ul>
	{% endfor %}

  </div>
</div>
