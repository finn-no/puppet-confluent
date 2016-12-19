class confluent::schema_registry::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/schema-registry',
  $daemonname = 'schema-registry',
  $propertyname = 'schema-registry.properties',
  $pidpattern = '[s]chema-registry',
  $require_zookeeper = true,
  $require_kafka = true,
 ) {

  file { '/etc/init.d/kafka-schema_registry':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
  }

  if $require_kafka {
    $kafka_requirement = [Service['kafka-server']]
  }
  else {
    $kafka_requirement = []
  }

  if $require_zookeeper {
    $zookeeper_requirement = [Service['zookeeper']]
  }
  else {
    $zookeeper_requirement = []
  }

  $require = concat([File['/etc/init.d/kafka-schema_registry']],
                    $kafka_requirement,
                    $zookeeper_requirement)

  service { 'kafka-schema_registry':
    ensure  => running,
    enable  => true,
    require => $require,
    provider => 'init',
  }

}
