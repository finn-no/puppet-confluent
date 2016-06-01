class confluent::restservice::service {

  file { '/etc/init.d/kafka-restservice':
    ensure => file,
    mode   => '0755',
  }

  service { 'kafka-restservice':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-restservice'],
  }

}
