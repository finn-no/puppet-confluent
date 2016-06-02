class confluent::kafka::config (

) {

  ::confluent::propertyfile { '/etc/kafka/server.properties':
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

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }

  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }
  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }
  ::confluent::propertyfile { '':
    propertyhash => {},
    component    => '',
  }


}
