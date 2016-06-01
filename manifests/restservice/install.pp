class confluent::restservice::install {

  package { 'confluent-kafka-rest':
    ensure => installed,
  }

}
