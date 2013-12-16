class activemq::config inherits activemq {

  File {
    owner => root,
    group => root,
    mode  => '0644',
  }

  file { '/usr/share/activemq/activemq-options':
    ensure  => present,
    content => template('activemq/activemq-options.erb'),
  }

  file { '/etc/default/activemq':
    ensure  => present,
    content => template('activemq/default.erb'),
  }

}
