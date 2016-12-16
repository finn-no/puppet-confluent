class confluent::kafka_rest::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka-rest',
  $daemonname = 'kafka-rest',
  $propertyname = 'kafka-rest.properties',
  $pidpattern = '[k]afka-rest',
  $require_zookeeper = false,
  $require_kafka = false,
  $require_schema_registry = false,
){

  file { '/etc/init.d/kafka-rest':
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

  if $require_schema_registry {
    $schema_registry_requirement = [Service['kafka-schema_registry']]
  }
  else {
    $schema_registry_requirement = []
  }

  $require = concat([File['/etc/init.d/kafka-rest']],
                    $kafka_requirement,
                    $zookeeper_requirement,
                    $schema_registry_requirement,
  )

  service { 'kafka-rest':
    ensure  => running,
    enable  => true,
    require => $require,
    provider => 'init',
  }

}
