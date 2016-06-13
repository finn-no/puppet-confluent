class confluent::schemaregistry::install {

  package { 'confluent-schema-registry':
    ensure  => installed,
    require => Exec['repo update'],
  }

}
