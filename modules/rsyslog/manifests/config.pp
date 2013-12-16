class rsyslog::config inherits rsyslog {

  file {'/etc/rsyslog.conf':
    content => template('rsyslog/rsyslog.conf.erb'),
  }

}
