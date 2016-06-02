class confluent::schemaregistry::config {

  ::confluent::propertyfile { '/etc/schema-registry/schema-registry.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

  ::confluent::propertyfile { '/etc/schema-registry/connect-avro-distributed.properties':
    propertyhash => $::confluent::connect_avro_distributed_properties,
    component    => 'connect-avro-distributed',
  }

  ::confluent::propertyfile { '/etc/schema-registry/connect-avro-standalone.properties':
    propertyhash => $::confluent::connect_avro_standalone_properties,
    component    => 'connect-avro-standalone',
  }

  ::confluent::propertyfile { '/etc/schema-registry/log4j.properties':
    propertyhash => $::confluent::schemaregistry_log4j_properties,
    component    => 'schemaregistry',
  }

}
