class rsyslog {

  class {'rsyslog::package':
    notify => Class['rsyslog::service'],
  }

  class {'rsyslog::config':
    notify  => Class['rsyslog::service'],
    require => Class['rsyslog::package'],
  }

  class {'rsyslog::service':
    require => Class['rsyslog::config'],
  }

}
