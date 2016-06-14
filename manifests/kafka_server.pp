class confluent::kafka_server { 

  require confluent::repo

  class { '::confluent::kafka_server::config': } ->
  class { '::confluent::kafka_server::service': }


}
