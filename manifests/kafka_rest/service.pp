class confluent::kafka_rest::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka-rest',
  $daemonname = 'kafka-rest',
  $propertyname = 'kafka-rest.properties',
  $pidpattern = '[k]afka-rest',
){

  file { '/etc/init.d/kafka-rest':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  service { 'kafka-rest':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-rest'],
  }

}
