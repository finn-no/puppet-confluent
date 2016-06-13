class confluent::restservice::install {

  package { 'confluent-kafka-rest':
    ensure => installed,
    require => Exec['repo update'],
  }

}
