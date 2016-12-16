class confluent::repo::apt {

  apt::key { 'confluent':
    key        => '1A77041E0314E6C5A486524E670540C841468433',
    #server => 'pgp.mit.edu',
    #content  => template('confluent/repo/archive.key.erb'),
  } ->

  file { '/etc/apt/sources.list.d/confluent.list':
    ensure  => file,
    content => "deb [arch=amd64] http://packages.confluent.io/deb/3.1 stable main",
    mode    => '0644',
    notify  => Exec['repo update'],
  }

  exec { 'repo update':
    path        => '/usr/sbin:/usr/bin:/sbin:/bin',
    command     => 'apt-get -y update',
    refreshonly => true,
  }

}
