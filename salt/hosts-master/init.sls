{%- for minion_id, addrlist in salt['mine.get']('*', 'network.ip_addrs').items() %}
{{ minion_id }}-host-entry:
  host.present:
{% if addrlist is string %}
    - ip: {{ addrlist }}
{% else %}
    - ip: {{ addrlist|first }}
{% endif %}
    - names:
      - {{ minion_id }}
      - {{ minion_id }}.{{ pillar['internal_infra_domain'] }}
{% endfor %}
