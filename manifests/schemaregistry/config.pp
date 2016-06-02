class confluent::schemaregistry::config {

  ::confluent::propertyfile { '/etc/schema-registry/schema-registry.properties':
    propertyhash => $::confluent::schemaregistry_properties,
    component    => 'schemaregistry',
  }

}
