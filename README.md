# confluent

## Description

finn-confluent is a puppet module to install, configure and run confluent.io distribution of kafka, zookeeper, schema-registry and rest service, on same or separate nodes in clusters. 

## Setup

### Setup Requirements

Java should be installed if you hope to run confluent components. See below for simple starter. 

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

## References

* http://www.confluent.io/

## Limitations

Code is written for Debian, tested on debian. Provisions are in place for expansion, but no effort is made to run on RedHat-style. In fact, as it stands, it won't.
