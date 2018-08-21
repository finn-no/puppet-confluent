class confluent::schema_registry::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/schema-registry',
  $daemonname = 'schema-registry',
  $propertyname = 'schema-registry.properties',
  $pidpattern = '[s]chema-registry',
 )  {

  $systemd_service_wants = 'Wants=zookeeper.service'

  file { '/etc/init.d/kafka-schema_registry':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  systemd::unit_file { 'kafka-schema_registry.service':
    ensure  => file,
    content => template('confluent/systemd.service.erb'),
  }

  service { 'kafka-schema_registry':
    ensure  => running,
    enable  => true,
    require  => [ File['/etc/init.d/kafka-schema_registry'], Systemd::Unit_File['kafka-schema_registry.service'], Exec['systemctl-daemon-reload'] ]
  }

}
