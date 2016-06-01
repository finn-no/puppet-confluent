class confluent (  
  $version        = '3.0',
  $scala_version  = '2.11',
  $kafka          = false,
  $zookeeper      = false,
  $schemaregistry = false,
  $restservice    = false,
) {

  if ! ($kafka or $zookeeper or $schemaregistry or $restservice) {
    fail('You must choose to install at least one component')
  }

  # Kafka and zookeeper are in same package

  if ($kafka or $zookeeper) {

    $packages = [ "confluent-kafka-${::confluent::scala_version}" ]

    package { $packages:
      ensure => installed,
    }

    if $kafka {
      include ::confluent::kafka
    }

    if $zookeeper {
      include ::confluent::zookeeper
    }

  }

  #Separate components

  if $schemaregistry {
    include ::confluent::schemaregistry
  }

  if $restservice {
    include ::confluent::restservice
  }

}
