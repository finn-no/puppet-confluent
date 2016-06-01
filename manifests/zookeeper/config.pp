class confluent::zookeeper::config {

  $zookeeper_propertyfile = '/etc/kafka/zookeeper.properties'

  $keys = keys(merge({}, $::confluent::zookeeper_properties))

  ::confluent::property { $keys:
    propertyfile => $zookeeper_propertyfile,
    component    => 'zookeeper',
    settingshash => $::confluent::zookeeper_properties,
  }

}
