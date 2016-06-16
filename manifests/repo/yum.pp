class confluent::repo::yum {

  file { '/etc/yum.repos.d/confluent.repo':
    ensure  => file,
    content => template('confluent/repo/yum.erb'),
    mode    => '0644',
  } ->

  exec { 'repo update':
    user    => 'root',
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => 'yum clean all',
  }

}
