class confluent::defaults {

  $kafka_server_properties = {
		$listen_port              => 7794,
		$iothreads                => 8,
		$so_rcvbuf                => 1048576,
		$so_sndbuf                => 1048576,
		$sock_maxbytes            => 104857600,
		$replicafetchers          => 2,
		$enable_topicdel          => true,
		$flush_interval           => 10000,
		$flush_scheduler_interval => 2000,
		$logretention_minutes     => 4320,
		$enable_logcleaner        => true,
  }

  $zookeeper_properties = {
  }

  $restservice_properties = {
  }

  $schemaregistry_properties = {
  }

}
