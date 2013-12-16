class mcollective::service inherits mcollective {

  service { 'mcollective':
    ensure => running,
  }

}
