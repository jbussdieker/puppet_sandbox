class mcollective(
  $version = '2.0.0-1'
) {

  class {'mcollective::package':
    notify => Class['mcollective::service'],
  }

  class {'mcollective::config':
    notify  => Class['mcollective::service'],
    require => Class['mcollective::package'],
  }

  class {'mcollective::service':
    require => Class['mcollective::config'],
  }

}
