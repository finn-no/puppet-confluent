class confluent (
  $version                              = '3.0',
  $scala_version                        = '2.11',
  $kafka_server                         = false,
  $zookeeper                            = false,
  $schema_registry                      = false,
  $kafka_rest                           = false,

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
  
  $kafka_rest_properties                = {},
  $kafka_rest_log4j_properties          = {},
  
  $schema_registry_properties           = {},
  $connect_avro_distributed_properties  = {},
  $connect_avro_standalone_properties   = {},
  $schema_registry_log4j_properties     = {},
) {

  include confluent::repo

  if ! ($kafka_server or $zookeeper or $schema_registry or $kafka_rest) {
    fail('You must choose to install at least one component')
  }

  # Kafka and zookeeper are in same package

  if ($kafka_server or $zookeeper) {

    $packages = [ "confluent-kafka-${::confluent::scala_version}" ]

    package { $packages:
      ensure  => installed,
      require => Exec['repo update'],
    }

    if $kafka_server { include ::confluent::kafka_server }
    if $zookeeper { include ::confluent::zookeeper }

  }

  #Separate components
  if $schema_registry { include ::confluent::schema_registry }
  if $kafka_rest { include ::confluent::kafka_rest }

}

