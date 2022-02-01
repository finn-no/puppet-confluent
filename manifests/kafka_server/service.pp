class confluent::kafka_server::service (
  $daemonpath       = '/usr/bin',
  $configpath       = '/etc/kafka',
  $daemonname       = 'kafka-server',
  $propertyname     = 'server.properties',
  $pidpattern       = '[k]afkaServer',
  $kafka_opts       = $confluent::kafka_server_opts,
  $heap_opts        = $confluent::kafka_server_heap_opts,
) {

  $systemd_service_wants = 'Wants=zookeeper.service'

  file { '/etc/init.d/kafka-server':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/init.erb'),
    require => Package[ "confluent-kafka" ],
  }

  systemd::unit_file { 'kafka-server.service':
    ensure  => file,
    content => template('confluent/systemd.service.erb'),
    require => Package[ "confluent-kafka" ],
  }

  service { 'kafka-server':
    ensure  => running,
    enable  => true,
    require => [ File['/etc/init.d/kafka-server'], Systemd::Unit_File['kafka-server.service'], Exec['systemctl-daemon-reload'] ]
  }

}
