class confluent::restservice::config {

  file { '/etc/kafka/kafka-rest.properties':
    ensure => file,
    mode   => '0644',  
  }

}
