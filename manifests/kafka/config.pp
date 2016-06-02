class confluent::kafka::config (

) {

  ::confluent::propertyfile { '/etc/kafka/server.properties':
    propertyhash => $::confluent::kafka_server_properties,
    component    => 'kafka-server',
  }

  ::confluent::propertyfile { '/etc/kafka/log4j.properties':
    propertyhash => $::confluent::kafka_server_properties,
    component    => 'kafka-server',
  }



  ::confluent::propertyfile { '/etc/kafka/connect-console-sink.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-console-source.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-distributed.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-standalone.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-file-sink.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-file-source.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-log4j.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/producer.properties':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '/etc/kafka/consumer.properties':
    propertyhash => {},
    component    => '',
  }


  ::confluent::propertyfile { '/etc/kafka/tools-log4j.properties':
    propertyhash => {},
    component    => '',
  }

}
