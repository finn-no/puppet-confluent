class confluent::schemaregistry::config {

  file { '/etc/kafka/schemaregistry.properties':
    ensure  => file, 
    mode    => '0644',
    content => template('confluent/schemaregistry/schemaregistry.properties.erb'),
  }

}
