class rabbitmq(
  $ensure          = 'present',
  $enabled_plugins = []
) {

  class {'rabbitmq::package':
    notify => Class['rabbitmq::service'],
  }

  class {'rabbitmq::config':
    notify  => Class['rabbitmq::service'],
    require => Class['rabbitmq::package'],
  }

  class {'rabbitmq::service':
    require => Class['rabbitmq::config'],
  }

}
