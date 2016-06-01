class confluent::kafka::config (

) {

  $server_propertyfile = '/etc/kafka/server.properties'

  $keys = keys(merge({}, $::confluent::kafka_server_properties))

  confluent::property { $keys:
    propertyfile => $server_propertyfile,
    component    => 'kafkaserver',
    settingshash => $::confluent::kafka_server_properties,
  }

}
