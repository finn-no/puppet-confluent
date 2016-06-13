package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka          => true,
  zookeeper      => true,
  restservice    => true,
  schemaregistry => true,
}
