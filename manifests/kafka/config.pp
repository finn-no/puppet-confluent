class confluent::kafka::config (

) {

  $server_propertyfile = '/etc/kafka/server.properties'
  $real_server_properties = merge($::confluent::defaults::kafka_server_properties, $::confluent::kafka_server_config_overrides)

  $keys = keys($real_server_properties)

  confluent::property { $keys:
    propertyfile => $server_propertyfile,
    component    => 'kafkaserver',
    settingshash => $real_server_properties,
  }

}
