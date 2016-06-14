class confluent::kafka_rest::config {

  ::confluent::propertyfile { '/etc/kafka_rest/kafka_rest.properties':
    propertyhash => $::confluent::kafka_rest_properties,
    component    => 'kafka_rest',
  }

  ::confluent::propertyfile { '/etc/kafka_rest/log4j.properties':
    propertyhash => $::confluent::kafka_rest_log4j_properties,
    component    => 'kafka_rest',
  }


}
