class confluent::kafka_rest {
  class { 'confluent::kafka_rest::install': }
  -> class { 'confluent::kafka_rest::config': }
  ->class { 'confluent::kafka_rest::service': }
}
