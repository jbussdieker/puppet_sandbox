define activemq::instance(
  $config      = template('activemq/activemq.xml.erb'),
  $logger      = template('activemq/log4j.properties.erb')
) {

  File {
    owner   => root,
    group   => root,
    notify  => Class['activemq::service'],
    require => Class['activemq::package'],
  }

  file {"/etc/activemq/instances-available/${name}":
    ensure  => directory,
    mode    => 0755,
  }

  file {"/etc/activemq/instances-available/${name}/activemq.xml":
    ensure  => present,
    mode    => 0644,
    content => $config,
    require => File["/etc/activemq/instances-available/${name}"],
  }

  file { "/etc/activemq/instances-available/${name}/log4j.properties":
    ensure  => present,
    mode    => 0644,
    content => $logger,
    require => File["/etc/activemq/instances-available/${name}"],
  }

  file {"/etc/activemq/instances-enabled/${name}":
    ensure => link,
    force  => true,
    target => "/etc/activemq/instances-available/${name}",
  }

}
