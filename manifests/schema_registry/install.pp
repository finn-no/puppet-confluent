class confluent::schema_registry::install {

  package { 'confluent-schema-registry':
    ensure  => installed,
    require => Exec['repo update'],
  }

}
