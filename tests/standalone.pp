$pname = $osfamily ? {
  'Debian' => 'openjdk-7-jre',
  'RedHat' => 'java-1.7.0-openjdk',
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
