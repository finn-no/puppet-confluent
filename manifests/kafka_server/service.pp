class confluent::kafka_server::service (
  $daemonpath        = '/usr/bin',
  $configpath        = '/etc/kafka',
  $daemonname        = 'kafka-server',
  $propertyname      = 'server.properties',
  $pidpattern        = '[k]afkaServer',
  $kafka_opts        = $confluent::kafka_server_opts,
  $heap_opts         = $confluent::kafka_server_heap_opts,
  $require_zookeeper = true,
) {

  file { '/etc/init.d/kafka-server':
    ensure  => file,
    mode    => '0755',    
    content => template('confluent/init.erb'),
    require => Package[ "confluent-kafka-${::confluent::scala_version}" ],
  }

  if $require_zookeeper {
    $require = [File['/etc/init.d/kafka-server'],
                Service['zookeeper']]
  }
  else {
    $require = [File['/etc/init.d/kafka-server']]
  }

  service { 'kafka-server':
    ensure   => running,
    enable   => true,
    require  => $require,
    provider => 'init',
  }

}
