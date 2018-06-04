class { '::wazuh::client':
  ossec_server_ip    => '172.28.128.10',
  manage_client_keys => 'authd',
}
