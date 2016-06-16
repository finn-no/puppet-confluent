class confluent::repo::apt {

  apt::key { 'confluent':
    id      => '670540C841468433',
    server  => 'pgp.mit.edu',
  } ->

  file { '/etc/apt/sources.list.d/confluent.list':
    ensure  => file,
    content => "deb [arch=amd64] http://packages.confluent.io/deb/${::confluent::version} stable main",
    mode    => '0644',
    notify  => Exec['repo update'],
  }

  exec { 'repo update':
    path        => '/usr/sbin:/usr/bin:/sbin:/bin',
    command     => 'apt-get -y update',
    refreshonly => true,  
  }

}
