class confluent::schemaregistry {

  class { 'confluent::schemaregistry::install': } ->
  class { 'confluent::schemaregistry::config': } ->
  class { 'confluent::schemaregistry::service': } 

}
