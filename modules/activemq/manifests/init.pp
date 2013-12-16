class activemq(
  $version = '5.5.0+dfsg-6ubuntu1.1'
) {

  include java

  class {'activemq::package':
    notify => Class['activemq::service'],
  }

  class {'activemq::config':
    notify  => Class['activemq::service'],
    require => Class['activemq::package'],
  }

  class {'activemq::service':
    require => Class['activemq::config'],
  }

}
