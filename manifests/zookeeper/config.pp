class confluent::zookeeper::config {

  if $::confluent::zookeeper_myid {

    file { "$::confluent::zookeeper_datadir":
      ensure => directory,
    }      

    file { "${::confluent::zookeeper_datadir}/myid":
      ensure  => file,
      content => $::confluent::zookeeper_myid,
      mode    => '0644',
#      notify  => Service['zookeeper'],
      require => Package["confluent-kafka-${::confluent::scala_version}"],
    }
  }

  ::confluent::propertyfile { '/etc/kafka/zookeeper.properties':
    propertyhash =>$::confluent::zookeeper_properties,
    component    => 'zookeeper',
#    notify       => Service['zookeeper'],
    require => Package["confluent-kafka-${::confluent::scala_version}"],
  }

}
