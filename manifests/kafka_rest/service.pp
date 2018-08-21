class confluent::kafka_rest::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka-rest',
  $daemonname = 'kafka-rest',
  $propertyname = 'kafka-rest.properties',
  $pidpattern = '[k]afka-rest',
){

  $systemd_service_wants = 'Wants=kafka-server.service'

  file { '/etc/init.d/kafka-rest':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  systemd::unit_file { 'kafka-rest.service':
    ensure  => file,
    content => template('confluent/systemd.service.erb'),
  }

  service { 'kafka-rest':
    ensure  => running,
    enable  => true,
    require => [ File['/etc/init.d/kafka-rest'], Systemd::Unit_File['kafka-rest.service'], Exec['systemctl-daemon-reload'] ]
  }

}
