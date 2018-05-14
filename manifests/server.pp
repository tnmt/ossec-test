class { 'ossec::server':
  mailserver_ip => 'localhost',
  ossec_emailto => ['s@tnmt.info'],
}
