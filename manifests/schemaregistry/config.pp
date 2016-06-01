class confluent::schemaregistry::config {

  $schemaregistry_propertyfile = '/etc/kafka/schemaregistry.properties'

  $keys = keys(merge({}, $::confluent::schemaregistry_properties))

  ::confluent::property { $keys:
    propertyfile => $schemaregistry_propertyfile,
    component    => 'schemaregistry',
    settingshash => $::confluent::schemaregistry_properties,
  }

}
