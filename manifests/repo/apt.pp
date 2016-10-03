class confluent::repo::apt {

  apt::key { 'confluent':
    id      => '8911D8FF37778F24B4E726A218609E3D7580C77F',
    #server => 'pgp.mit.edu',
    content  => template('confluent/repo/archive.key.erb'),
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
