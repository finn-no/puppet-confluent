class confluent::zookeeper::config {

  file { '/etc/kafka/zookeeper.properties':
    ensure  => file,
    mode    => '0644',
    content => template('confluent/kafka/zookeeper.properties.erb'),
  }

}
