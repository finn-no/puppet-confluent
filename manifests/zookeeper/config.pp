class confluent::zookeeper::config {

  ::confluent::propertyfile { '/etc/kafka/zookeeper.properties':
    propertyhash =>$::confluent::zookeeper_properties,
    component    => 'zookeeper',
  }

}
