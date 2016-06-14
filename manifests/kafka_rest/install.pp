class confluent::kafka_rest::install {

  package { 'confluent-kafka_rest':
    ensure => installed,
    require => Exec['repo update'],
  }

}
