class confluent::zookeeper::config {

  if $::conflient::zookeeper_myid {
    file { "$::confluent::zookeeper_datadir/myid":
      ensure  => file,
      content => $::conflient::zookeeper_myid,
      mode    => '0644',      
  }

  ::confluent::propertyfile { '/etc/kafka/zookeeper.properties':
    propertyhash =>$::confluent::zookeeper_properties,
    component    => 'zookeeper',
  }

}
