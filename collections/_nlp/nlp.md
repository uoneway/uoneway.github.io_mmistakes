---
title: "NLP"
permalink: /categories/nlp/
layout: category
---
{% for staff_member in site.nlp %}
  <h2>
    <a href="{{ staff_member.url }}">
      {{ staff_member.name }} - {{ staff_member.position }}
    </a>
  </h2>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}