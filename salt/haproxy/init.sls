---
include:
  - repositories

haproxy:
  pkg.installed:
  - pkgs:
    - kubernetes-node
  - require:
    - file: /etc/zypp/repos.d/containers.repo
  file.managed:
  - name: /etc/haproxy/haproxy.cfg
    source: salt://haproxy/haproxy.cfg.jinja
    template: jinja
    user: root
    group: root
    mode: 644
    makedirs: True
    dir_mode: 755

/etc/kubernetes/manifests/haproxy.manifest:
  file.managed:
  - source: salt://haproxy/haproxy.manifest
    template: jinja
    user: root
    group: root
    mode: 644
    makedirs: True
    dir_mode: 755
