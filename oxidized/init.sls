{% from "oxidized/map.jinja" import oxidized with context %}

oxidized_pkgs_install:
  pkg.installed:
    - names: {{ oxidized.lookup.pkgs }}

oxidized_gems_install:
  gem.installed:
    - names: {{ oxidized.lookup.gems }}

# Configure user/group
oxidized_user:
  user.present:
    - name: {{ oxidized.general.user }}
    - gid: {{ oxidized.general.group }}
    - home: {{ oxidized.general.home }}
    - shell: /bin/false
    - system: True
    - require:
      - group: oxidized_user
  group.present:
    - name: {{ oxidized.general.group }}
    - system: True

# Log file
oxidized_log:
  file.managed:
    - name: {{ oxidized.config.log }}
    - user: {{ oxidized.general.user }}
    - group: {{ oxidized.general.group }}
    - mode: 0644
    - require:
      - user: {{ oxidized.general.user }}

# Data folder
oxidized_directories:
  file.directory:
    - names:
      - /etc/oxidized
      - /var/lib/oxidized
    - user: {{ oxidized.general.user }}
    - group: {{ oxidized.general.group }}
    - mode: 0755
    - require:
      - user: {{ oxidized.general.user }}
