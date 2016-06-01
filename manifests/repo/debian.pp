class confluent::repo::debian {

  apt::key { 'confluent':
    id      => '670540C841468433',
    server  => 'pgp.mit.edu',
  }

  file { '/etc/apt/sources.list.d/confluent.list':
    ensure  => file,
    content => "deb [arch=amd64] http://packages.confluent.io/deb/${::confluent_version} stable main",
    mode    => '0644',
    notify  => Exec['confluent apt update'],
  }

  exec { 'confluent apt update':
    path        => '/usr/sbin:/usr/bin:/sbin:/bin',
    command     => 'apt-get -y update',
    refreshonly => true,  
  }


}
