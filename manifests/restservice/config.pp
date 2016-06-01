class confluent::restservice::config {

  file { '/etc/kafka/kafka-rest.properties':
    ensure  => file,
    mode    => '0644',  
    content => template('confluent/restservice/kafka-rest.properties.erb')
  }

}
