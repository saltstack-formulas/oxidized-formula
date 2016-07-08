oxidized_systemd:
  file.managed:
    - name: /lib/systemd/system/oxidized.service
    - source: salt://oxidized/files/oxidized.service
    - user: root
    - group: root
    - mode: 644
    - template: jinja

  service.running:
    - name: oxidized
    - enable: True
    - watch:
      - file: oxidized_systemd
