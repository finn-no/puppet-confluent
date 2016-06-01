class confluent::zookeeper::config {

  file { '/etc/kafka/zookeeper.properties':
    ensure => file,
    mode   => '0644',
  }

}
