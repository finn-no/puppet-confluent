class confluent::restservice::config {

  $restservice_propertyfile = '/etc/kafka/restservice.properties'

	$real_restservice_properties = merge($::confluent::defaults::restservice_properties, $::confluent::restservice_config_overrides)

  $keys = keys($real_restservice_properties)

  ::confluent::property { $keys:
    propertyfile => $restservice_propertyfile,
    component    => 'restservice',
    settingshash => $real_restservice_properties,
  }

}
