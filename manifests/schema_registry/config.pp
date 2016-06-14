class confluent::schema_registry::config {

  ::confluent::propertyfile { '/etc/schema-registry/schema-registry.properties':
    propertyhash => $::confluent::schema_registry_properties,
    component    => 'schema_registry',
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
    propertyhash => $::confluent::schema_registry_log4j_properties,
    component    => 'schema_registry',
  }

}
