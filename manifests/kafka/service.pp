class confluent::kafka::service {

  file { '/etc/init.d/kafka-server':
    ensure => file,
    mode   => '0755',
  }

  service { 'kafka-server':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-server'],
  }

}
