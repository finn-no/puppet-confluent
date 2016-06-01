class confluent (
  $kafka          = false,
  $kafkastreams   = false,
  $zookeeper      = false,
  $schemaregistry = false,
  $restservice    = false,
) inherits confluent::params {

  if not ($kafka or $kafkastreams or $zookeeper or $schemaregistry or $restservice) {
    fail('You must choose to install at least one component')
  }

  if $kafka {
    include ::confluent::kafka
  }

  if $kafkastreams {
    include ::confluent::kafkastreams
  }

  if $zookeeper {
    include ::confluent::zookeeper
  }

  if $schemaregistry {
    include ::confluent::schemaregistry
  }

  if $restservice {
    include ::confluent::restservice
  }

}
