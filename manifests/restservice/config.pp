class confluent::restservice::config {

  ::confluent::propertyfile { '/etc/kafka-rest/kafka-rest.properties':
    propertyhash => $::confluent::restservice_properties,
    component    => 'restservice',
  }

  ::confluent::propertyfile { '/etc/kafka-rest/log4j.properties':
    propertyhash => $::confluent::restservice_properties,
    component    => 'restservice',
  }


}
