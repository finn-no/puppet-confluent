class confluent::zookeeper::service { 

  file { '/etc/init.d/zookeeper':
    ensure => file,
    mode   => '0755',
  }

  service { 'zookeeper':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/zookeeper'],
  }

}
