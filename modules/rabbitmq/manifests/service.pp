class rabbitmq::service inherits rabbitmq {

  service {'rabbitmq-server':
    ensure => running,
  }

}
