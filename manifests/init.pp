class confluent (
  $confluent_version = '3.0',
  $kafka          = false,
  $kafkastreams   = false,
  $zookeeper      = false,
  $schemaregistry = false,
  $restservice    = false,
) {
*.swp
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
