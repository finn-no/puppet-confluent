class confluent (  
  $brokerid,
  $version                              = '3.0',
  $scala_version                        = '2.11',
  $kafka                                = false,
  $zookeeper                            = false,
  $schemaregistry                       = false,
  $restservice                          = false,
  ### subcomnponent defaults, one by one
  ### kafka
  $kafkaserver_listen_port              = 7794,
  $kafkaserver_iothreads                = 8,
  $kafkaserver_so_rcvbuf                = 1048576,
  $kafkaserver_so_sndbuf                = 1048576,
  $kafkaserver_sock_maxbytes            = 104857600,
  $kafkaserver_replicafetchers          = 2,
  $kafkaserver_enable_topicdel          = true,
  $kafkaserver_flush_interval           = 10000,
  $kafkaserver_flush_scheduler_interval = 2000,
  $kafkaserver_logretention_minutes     = 4320,
  $kafkaserver_enable_logcleaner        = true,

  ### zookeeper
  ### schemaregistry
  ### restservice
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
