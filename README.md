# confluent

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with confluent](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with confluent](#beginning-with-confluent)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

finn-confluent is a puppet module to install, configure and run confluent.io distribution of kafka, zookeeper, schema-registry and rest service, on same or separate nodes in clusters. 

## Setup

### Setup Requirements

Java should be installed if you hope to run confluent components. See below for simple starter. 

### Beginning with confluent

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

## Usage

## Reference

* http://www.confluent.io/

## Limitations

Code is written for Debian, tested on debian. Provisions are in place for expansion, but no effort is made to run on RedHat-style. In fact, as it stands, it won't.
