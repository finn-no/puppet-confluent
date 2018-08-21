class confluent::schema_registry {
  class { 'confluent::schema_registry::install': }
  -> class { 'confluent::schema_registry::config': }
  -> class { 'confluent::schema_registry::service': }

}
