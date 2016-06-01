class confluent::restservice {

  class { 'confluent::restservice::install': } ->
  class { 'confluent::restservice::config': } ->
  class { 'confluent::restservice::service': } 


}
