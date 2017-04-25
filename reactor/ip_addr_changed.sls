{%- set api_servers = salt['pillar.get']('roles:kube-master', '') %}
{%- set sender      = data['id'] %}

{% if sender in api_servers %}

# one of the API servers has changed IP:
# updpate the "<ip> api api.infra.caasp.local" in the minions
update_hosts_in_minions:
  local.state.apply:
    - tgt: 'roles:kube-minion'
    - tgt_type: grain
    - arg:
      - host-minion

{% else %}

# one of the minions has changed IP:
# updpate the "<ip> <hash> <hash>.infra.caasp.local" in the masters
update_hosts_in_masters:
  local.state.apply:
    - tgt: 'roles:kube-master'
    - tgt_type: grain
    - arg:
      - host-master

{% endif %}
