class { 'wazuh::server':
  smtp_server         => 'localhost',
  ossec_emailto       => ['s@tnmt.info'],
  manage_client_keys  => 'authd',
  ossec_authd_enabled => true,
}

exec { 'self-signed certificate':
  path    => ['/bin'],
  command => 'openssl req -x509 -batch -nodes -days 365 -newkey rsa:2048 -keyout /var/ossec/etc/sslmanager.key -out /var/ossec/etc/sslmanager.cert',
  creates => '/var/ossec/etc/sslmanager.cert',
  require => Class['wazuh::server'],
}
