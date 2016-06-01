class confluent::repo::debian {

  file { '/etc/apt/sources.list.d/confluent.list':
    ensure  => file,
    mode    => '0644',
    content => "deb [arch=amd64] http://packages.confluent.io/deb/3.0 stable main\n",
    notify  => Exec['confluent repo apt update'],
  }

  exec { 'confluent repo apt update':
    path        => '/usr/sbin:/usr/bin:/sbin:/bin',
    command     => 'apt-get update',
    refreshonly => true,
  }

}
