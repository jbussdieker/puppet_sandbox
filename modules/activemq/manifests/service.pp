class activemq::service inherits activemq {

  service {'activemq':
    ensure => running,
  }

}
