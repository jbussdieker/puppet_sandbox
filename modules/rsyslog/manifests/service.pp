class rsyslog::service inherits rsyslog {

  service {'rsyslog':
    ensure => running,
  }

}
