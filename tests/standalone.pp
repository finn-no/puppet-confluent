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

package { $pname:
  ensure => present,
} ->

class { 'confluent':
  #kafka_server       => true,
  zookeeper           => true,
  #kafka_rest         => true,
  #schema_registry    => true,
  zookeeper_opts      => "-Dcom.sun.management.jmxremote.port=33333",
  zookeeper_heap_opts => "-Xmx756M -Xms756M", 
  zookeeper_properties          => {
    'autopurge.snapRetainCount' => '24',
  }
}
