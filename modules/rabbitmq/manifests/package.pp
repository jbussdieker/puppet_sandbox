class rabbitmq::package inherits rabbitmq {

  package {'rabbitmq-server':
    ensure => $ensure,
  }

}
