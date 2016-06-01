class confluent::kafka { 

  class { '::confluent::kafka::config': } ->
  class { '::confluent::kafka::service': }


}
