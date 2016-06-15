class confluent::zookeeper::config {

  if $::confluent::zookeeper_myid {
    file { "$::confluent::zookeeper_datadir/myid":
      ensure  => file,
      content => $::conflient::zookeeper_myid,
      mode    => '0644',
      notify       => Service['zookeeper'],
    }
  }

  ::confluent::propertyfile { '/etc/kafka/zookeeper.properties':
    propertyhash =>$::confluent::zookeeper_properties,
    component    => 'zookeeper',
    notify       => Service['zookeeper'],
  }

}
