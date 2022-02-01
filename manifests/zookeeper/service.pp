class confluent::zookeeper::service (
  $daemonpath   = '/usr/bin',
  $configpath   = '/etc/kafka',
  $daemonname   = 'zookeeper-server',
  $propertyname = 'zookeeper.properties',
  $pidpattern   = '[z]ookeeper.server',
  $kafka_opts   = $confluent::zookeeper_opts,
  $heap_opts    = $confluent::zookeeper_heap_opts,
) {

  file { '/etc/init.d/zookeeper':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
    require => Package[ "confluent-kafka" ],
  }

  systemd::unit_file { 'zookeeper.service':
    ensure  => file,
    content => template('confluent/systemd.service.erb'),
    require => Package[ "confluent-kafka" ],
  }

  service { 'zookeeper':
    ensure   => running,
    enable   => true,
    require  => [ File['/etc/init.d/zookeeper'], Systemd::Unit_File['zookeeper.service'], Exec['systemctl-daemon-reload'] ]
  }

}
