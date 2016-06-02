class confluent::schemaregistry::config {

  $schemaregistry_propertyfile = '/etc/schema-registry/schema-registry.properties'

  $keys = keys(merge({}, $::confluent::schemaregistry_properties))

  ::confluent::property { $keys:
    propertyfile => $schemaregistry_propertyfile,
    component    => 'schemaregistry',
    settingshash => $::confluent::schemaregistry_properties,
  }

}
