class confluent::zookeeper::service (
  $daemonpath = '/usr/bin',
  $configpath = '/etc/kafka',
  $daemonname = 'zookeeper',
  $propertyname = 'zookeeper.properties',
  $pidpattern = 'zookeeper',
) { 

  file { '/etc/init.d/zookeeper':
    ensure  => file,
    mode    => '0755',
    content => template('confluent/zookeeper/init.erb'),
  }

  service { 'zookeeper':
    noop    => true,
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/zookeeper'],
  }

}
