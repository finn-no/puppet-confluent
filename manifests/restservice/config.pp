class confluent::restservice::config {

  $restservice_propertyfile = '/etc/kafka/restservice.properties'

  $keys = keys(merge({}, $::confluent::restservice_properties))

  ::confluent::property { $keys:
    propertyfile => $restservice_propertyfile,
    component    => 'restservice',
    settingshash => $::confluent::restservice_properties,
  }

}
