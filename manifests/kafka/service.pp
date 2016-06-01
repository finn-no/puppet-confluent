class confluent::kafka::service {

  file { '/etc/init.d/kafka':
    ensure => file,
    mode   => '0755',
  }

  service { 'kafka':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka'],
  }

}
