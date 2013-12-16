class rsyslog::package inherits rsyslog {

  package {'rsyslog':
    ensure => present,
  }

}
