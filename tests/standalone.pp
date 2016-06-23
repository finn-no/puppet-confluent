case $osfamily {
  'Debian': {
    case $lsbdistcodename {
      'xenial':                     { $pname = 'openjdk-8-jdk' }
      'trusty', 'jessie', 'wheezy': { $pname = 'openjdk-7-jdk' }
    }
  }
  'RedHat': {
    case $operatingsystemmajrelease {
      '6': { $pname = 'java-1.7.0-openjdk' }
      '7': { $pname = 'java-1.8.0-openjdk' }
    }
  }
}

$kafka_server_properties = {
  'broker.id'                            => '1',
  'num.network.threads'                  => '8',
  'socket.receive.buffer.bytes'          => '1048576',
  'socket.send.buffer.bytes'             => '1048576',
  'socket.request.max.bytes'             => '104857600',
  'delete.topic.enable'                  => 'true',
  'num.replica.fetchers'                 => '2',
  'num.partitions'                       => '5',
  'log.flush.interval.ms'                => '10000',
  'log.flush.scheduler.interval.ms'      => '2000',
  'log.retention.minutes'                => '4320',
  'retention.minutes'                    => 'Event.ad.match:7200,Event.ad.searchable:14400',
  'log.cleaner.enable'                   => 'true',
  'auto.create.topics.enable'            => 'true',
  'default.replication.factor'           => '3',
  'controlled.shutdown.enable'           => 'true',
  'controlled.shutdown.max.retries'      => '3',
  'controlled.shutdown.retry.backoff.ms' => '5000',
  'zookeeper.connection.timeout.ms'      => '1000000',
}

$zookeeper_properties = { 
	'tickTime'                  => '2000',
	'initLimit'                 => '5',
	'syncLimit'                 => '2',
	'maxClientCnxns'            => '100',
	'autopurge.snapRetainCount' => '24',
	'autopurge.purgeInterval'   => '1',
}

$zookeeper_jmx_opts = '-Dcom.sun.management.jmxremote.port=27795'
$kafka_server_jmx_opts = '-Dcom.sun.management.jmxremote.port=27794'

package { $pname:
  ensure => present,
} ->

class { 'confluent':
  kafka_server             => true,
  kafka_server_properties  => $kafka_server_properties,
  kafka_server_opts        => $kafka_server_jmx_opts,
  kafka_heap_opts          => "-Xmx1024M -Xms1024M", 
  zookeeper                => true,
  zookeeper_opts           => $zookeeper_jmx_opts,
  zookeeper_heap_opts      => "-Xmx1024M -Xms1024M", 
  zookeeper_properties     => $zookeeper_properties,
  kafka_rest               => true,
  schema_registry          => true,
}
