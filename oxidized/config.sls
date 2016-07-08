{% from "oxidized/map.jinja" import oxidized with context %}
{% set oxidized = oxidized.general %}

include:
 - oxidized

oxidized_config:
  file.managed:
    - name: {{ oxidized.home }}/config
    - source: salt://oxidized/files/config
    - user: {{ oxidized.user }}
    - group: {{ oxidized.group }}
    - mode: 640
    - template: jinja
