class confluent::kafka::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka',
  $daemonname = 'kafka-server',
  $propertyname = 'server.properties',
  $pidpattern = 'kafka.Kafka',
) {

  file { '/etc/init.d/kafka-server':
    ensure  => file,
    mode    => '0755',    
    content => template('confluent/kafka/init.erb'),
  }

  service { 'kafka-server':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-server'],
  }

}
