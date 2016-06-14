package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka_server    => true,
  zookeeper       => true,
  kafka_rest      => true,
  schema_registry => true,
}
