class confluent::schemaregistry::install {

  package { 'confluent-schema-registry':
    ensure => installed,
  }

}
