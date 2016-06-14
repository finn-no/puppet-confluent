class confluent::kafka_server::config (

) {

  ::confluent::propertyfile { '/etc/kafka/server.properties':
    propertyhash => $::confluent::kafka_server_properties,
    component    => 'kafka-server',
  }

  ::confluent::propertyfile { '/etc/kafka/log4j.properties':
    propertyhash => $::confluent::kafka_log4j_properties,
    component    => 'kafka-log4j',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-console-sink.properties':
    propertyhash => $::confluent::connect_console_sink_properties,
    component    => 'connect_console_sink',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-console-source.properties':
    propertyhash => $::confluent::connect_console_source_properties,
    component    => 'connect_console_source',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-distributed.properties':
    propertyhash => $::confluent::connect_distributed_properties,
    component    => 'connect_distributed',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-standalone.properties':
    propertyhash => $::confluent::connect_standalone_properties,
    component    => 'connect_standalone',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-file-sink.properties':
    propertyhash => $::confluent::connect_file_sink_properties,
    component    => 'connect_file_sink',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-file-source.properties':
    propertyhash => $::confluent::connect_file_source_properties,
    component    => 'connect_file_source',
  }

  ::confluent::propertyfile { '/etc/kafka/connect-log4j.properties':
    propertyhash => $::confluent::connect_log4j_properties,
    component    => 'connect_log4j',
  }

  ::confluent::propertyfile { '/etc/kafka/producer.properties':
    propertyhash => $::confluent::producer_properties,
    component    => 'producer',
  }

  ::confluent::propertyfile { '/etc/kafka/consumer.properties':
    propertyhash => $::confluent::consumer_properties,
    component    => 'consumer',
  }


  ::confluent::propertyfile { '/etc/kafka/tools-log4j.properties':
    propertyhash => $::confluent::tools_log4j_properties,
    component    => 'tools_log4j',
  }

}
