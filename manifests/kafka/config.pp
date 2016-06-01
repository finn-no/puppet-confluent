class confluent::kafka::config {

  file { '/etc/kafka/server.properties':
    ensure => file,
    mode   => '0644',
  }

}
