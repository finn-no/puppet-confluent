class confluent::restservice::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka-rest',
  $daemonname = 'kafka-rest',
  $propertyname = 'kafka-rest.properties',
  $pidpattern = '[k]afka-rest',
){

  file { '/etc/init.d/kafka-restservice':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  service { 'kafka-restservice':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-restservice'],
  }

}
