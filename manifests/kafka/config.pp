class confluent::kafka::config (

) {

  ::confluent::propertyfile { '/etc/kafka/server.properties':
    propertyhash => $::confluent::kafka_server_properties,
    component    => 'kafka-server',
  }

}
