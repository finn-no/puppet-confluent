class confluent::zookeeper { 
  
  class { '::confluent::zookeeper::config': } ->
  class { '::confluent::zookeeper::service': }

}
