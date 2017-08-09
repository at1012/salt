include:
  - repositories

kubernetes-common:
  pkg.installed:
    - pkgs:
      - kubernetes-common

/etc/kubernetes/config:
  file.managed:
    - source:     salt://kubernetes-common/config.jinja
    - template:   jinja
    - require:
      - pkg: kubernetes-common