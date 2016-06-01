class confluent::schemaregistry::config {

  $schemaregistry_propertyfile = '/etc/kafka/schemaregistry.properties'

	$real_schemaregistry_properties = merge($::confluent::defaults::schemaregistry_properties, $::confluent::schemaregistry_config_overrides)

  $keys = keys($real_schemaregistry_properties)

  ::confluent::property { $keys:
    propertyfile => $schemaregistry_propertyfile,
    component    => 'schemaregistry',
    settingshash => $real_schemaregistry_properties,
  }

}
