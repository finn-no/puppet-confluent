class confluent (
  #Major version selection, refer to confluent.io docs:
  $version                              = '3.1.1',
  $scala_version                        = '2.11',

  #components to include
  $kafka_server                         = false,
  $zookeeper                            = false,
  $schema_registry                      = false,
  $kafka_rest                           = false,

  #specific tuning, JVM/JMX and propertyfiles in particular
  $kafka_server_opts                    = '', #For instance, JVM options, excluding JVM opts
  $kafka_server_heap_opts               = '',
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
  $zookeeper_myid                       = undef,
  $zookeeper_opts                       = '',
  $zookeeper_heap_opts                  = '',
  
  $kafka_rest_properties                = {},
  $kafka_rest_log4j_properties          = {},
  
  $schema_registry_properties           = {},
  $connect_avro_distributed_properties  = {},
  $connect_avro_standalone_properties   = {},
  $schema_registry_log4j_properties     = {},
) {

  #Not exepected to change
  $zookeeper_datadir = '/var/lib/zookeeper'

  include confluent::repo

  if ! ($kafka_server or $zookeeper or $schema_registry or $kafka_rest) {
    fail('You must choose to install at least one component')
  }

  # Kafka and zookeeper are in same package, so must be handled here, 
  # then include componentspecific setups:

  if ($kafka_server or $zookeeper) {

    $packages = [ "confluent-kafka-${::confluent::scala_version}" ]

    package { $packages:
      ensure  => installed,
      require => Exec['repo update'],
    }

    if $kafka_server {
      include ::confluent::kafka_server

      if $schema_registry {
        exec { sleep_before_registry:
          path        => '/usr/local/bin:/usr/bin:/bin',
          command     => "sleep 10",
          subscribe   => Service['kafka-server'],
          refreshonly => true,
          before      => Service['kafka-schema_registry'],
        }
      }
    }

    if $zookeeper {
      include ::confluent::zookeeper

      if $kafka_server {
        exec { sleep_before_kafka:
          path        => '/usr/local/bin:/usr/bin:/bin',
          command     => "sleep 10",
          subscribe   => Service['zookeeper'],
          refreshonly => true,
          before      => Service['kafka-server'],
        }
      }
    }

  }

  #Separate components
  if $schema_registry { include ::confluent::schema_registry }
  if $kafka_rest { include ::confluent::kafka_rest }

}
