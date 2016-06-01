class confluent::zookeeper::config {

  $zookeeper_propertyfile = '/etc/kafka/zookeeper.properties'

	$real_zookeeper_properties = merge($::confluent::defaults::zookeeper_properties, $::confluent::zookeeper_config_overrides)

  $keys = keys($real_zookeeper_properties)

  ::confluent::property { $keys:
    propertyfile => $zookeeper_propertyfile,
    component    => 'zookeeper',
    settingshash => $real_zookeeper_properties,
  }

}
