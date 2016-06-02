class confluent::kafka { 

  require confluent::repo

  class { '::confluent::kafka::config': } ->
  class { '::confluent::kafka::service': }


}
