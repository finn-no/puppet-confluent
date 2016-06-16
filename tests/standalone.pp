case $osfamily {
  'Debian': {
    case $lsbdistcodename {
      'xenial':                     { $pname = 'openjdk-8-jre' }
      'trusty', 'jessie', 'wheezy': { $pname = 'openjdk-7-jre' }
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
  kafka_server    => true,
  zookeeper       => true,
  kafka_rest      => true,
  schema_registry => true,
}
