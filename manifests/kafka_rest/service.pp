class confluent::kafka_rest::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka_rest',
  $daemonname = 'kafka_rest',
  $propertyname = 'kafka_rest.properties',
  $pidpattern = '[k]afka-rest',
){

  file { '/etc/init.d/kafka-kafka_rest':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  service { 'kafka-kafka_rest':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-kafka_rest'],
  }

}
