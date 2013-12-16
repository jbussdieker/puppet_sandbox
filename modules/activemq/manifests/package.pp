class activemq::package inherits activemq {

  package {'activemq':
    ensure => $version,
  }

}
