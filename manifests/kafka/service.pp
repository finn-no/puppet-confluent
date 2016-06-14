class confluent::kafka::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka',
  $daemonname = 'kafka-server',
  $propertyname = 'server.properties',
  $pidpattern = '[k]afkaServer',
) {

  file { '/etc/init.d/kafka-server':
    ensure  => file,
    mode    => '0755',    
    content => template('confluent/init.erb'),
  }

  service { 'kafka-server':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-server'],
  }

}
