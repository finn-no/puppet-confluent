class confluent::schemaregistry::config {

  ::confluent::propertyfile { '/etc/schema-registry/schema-registry.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

  ::confluent::propertyfile { '/etc/schema-registry/connect-avro-distributed.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

  ::confluent::propertyfile { '/etc/schema-registry/connect-avro-standalone.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

  ::confluent::propertyfile { '/etc/schema-registry/log4j.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

}
