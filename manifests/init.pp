class confluent (  
  $version                              = '3.0',
  $scala_version                        = '2.11',
  $kafka                                = false,
  $zookeeper                            = false,
  $schemaregistry                       = false,
  $restservice                          = false,

  #properties for components may be added, packages define defaults. 
  $kafka_server_properties              = {},
  $kafka_log4j_properties               = {},
  $connect_console_sink_properties      = {},
  $connect_console_source_properties    = {},
  $connect_distributed_properties       = {},
  $connect_standalone_properties        = {},
  $connect_file_sink_properties         = {},
  $connect_file_source_properties       = {},
  $connect_log4j_properties             = {},
  $producer_properties                  = {},
  $consumer_properties                  = {},
  $tools_log4j_properties               = {},
  
  $zookeeper_properties                 = {},
  
  $restservice_properties               = {},
  $restservice_log4j_properties         = {},
  
  $schemaregistry_properties            = {},
  $connect_avro_distributed_properties  = {},
  $connect_avro_standalone_properties   = {},
  $schemaregistry_log4j_properties      = {},
) {

  include confluent::repo

  if ! ($kafka or $zookeeper or $schemaregistry or $restservice) {
    fail('You must choose to install at least one component')
  }

  # Kafka and zookeeper are in same package

  if ($kafka or $zookeeper) {

    $packages = [ "confluent-kafka-${::confluent::scala_version}" ]

    package { $packages:
      ensure  => installed,
      require => Class['confluent::repo'],
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

