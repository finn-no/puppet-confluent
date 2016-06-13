class confluent::schemaregistry::service {

  file { '/etc/init.d/kafka-schemaregistry':
    ensure => file,
    mode   => '0755',
  }

  service { 'kafka-schemaregistry':
    noop    => true,
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/kafka-schemaregistry'],
  }

}
