# confluent

## OS Support

Tested on:

* Debian Wheezy
* Debian Jessie
* Ubuntu 14.04 LTS

Will not run on osfamily RedHat. 

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
  kafka_server    => true,
  zookeeper       => true,
  kafka_rest      => true,
  schema_registry => true,
}
````

This is the simplest form you will be able to use. For multiple servers, include only the components you wish the node to run:

````
package { 'openjdk-7-jre':
  ensure => present,
} ->

class { 'confluent':
  kafka_server => true,
}
````

## Configuring components

See confluent/kafka docs for explanations of the different property files used to configure confluent components. The parameter names map directly to files in /etc/kafka, /etc/kafka-rest and /etc/schemaregistry. 

To configure components, you can pass in hashes with properties for relevant components. Any key=value pair can be set. 

### kafka server

````
class { 'confluent':
  kafka_server                         => true,
  kafka_server_properties              => {}, #main props for kafka server, pass in puppet key => value pairs 
  kafka_log4j_properties               => {},
  connect_console_sink_properties      => {},
  connect_console_source_properties    => {},
  connect_distributed_properties       => {},
  connect_standalone_properties        => {},
  connect_file_sink_properties         => {},
  connect_file_source_properties       => {},
  connect_log4j_properties             => {},
  producer_properties                  => {},
  consumer_properties                  => {},
  tools_log4j_properties               => {},
}
````
### Zookeeper

````
class { 'confluent':
  zookeeper              => true,
  zookeeper_myid         => '1',  #Will create a myid file telling zookeeper who she is
  zookeeper_properties   => {},
}
````

### Schema-registry
````
class { 'confluent':
  schema_registry                       => true,
  schema_registry_properties            => {},
  schema_registry_log4j_properties      => {},
  connect_avro_distributed_properties   => {},
  connect_avro_standalone_properties    => {},
}
````

### Kafka-rest
````
class { 'confluent':
  kafka_rest                    => true,
  kafka_rest_properties         => {},
  kafka_rest_log4j_properties   => {},
}
````

## References

* http://www.confluent.io/
