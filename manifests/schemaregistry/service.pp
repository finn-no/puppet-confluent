class confluent::schemaregistry::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/schema-registry',
  $daemonname = 'schema-registry',
  $propertyname = 'schema-registry.properties',
  $pidpattern = '[s]chema-registry',
 ) {

  file { '/etc/init.d/kafka-schemaregistry':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  service { 'kafka-schemaregistry':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-schemaregistry'],
  }

}
