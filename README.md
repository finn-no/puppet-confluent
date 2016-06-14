# confluent

## Description

finn-confluent is a puppet module to install, configure and run confluent.io distribution of kafka, zookeeper, schema-registry and rest service, on same or separate nodes in clusters. 

The module places a lot of faith in the packaging of confluent, and only deviations from properties in property files are allowed. In addition, SysV init scripts are provided to control the services (Only start-stop scripts are provided by the packages). 

## Setup

### Setup Requirements

You must classify your nodes with puppet, and java must be provided. See below for simple examples, and ways to provide properties for components. 

## Usage

Set up a standalone server like this:

````
package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka          => true,
  zookeeper      => true,
  restservice    => true,
  schemaregistry => true,
}
````

This is the simplest form you will be able to use. For multiple servers, include only the components you wish the node to run:

````
package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka          => true,
}
````

## Configuring components

See confluent/kafka docs for explanations of the different property files used to configure confluent components. The parameter names map directly to files in /etc/kafka, /etc/kafka-rest and /etc/schemaregistry. 

To configure components, you can pass in hashes with properties for relevant components. Any key=value pair can be set. 

### kafka server

For the kafka server, these hashes are available

````
class { 'confluent':
  kafka          => true,
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

}
````
### Zookeeper

````
class { 'confluent':
  kafka          => true,
}
````



### Schema-registry
````
package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka          => true,
}
````


### Kafka-rest
````
package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka          => true,
}
````


## References

* http://www.confluent.io/

## Limitations

Code is written for Debian, tested on debian. Provisions are in place for expansion, but no effort is made to run on RedHat-style. In fact, as it stands, it won't.
