class confluent::kafka_rest::install {

  package { 'confluent-kafka-rest':
    ensure  => installed,
    require => Exec['repo update'],
  }

}
