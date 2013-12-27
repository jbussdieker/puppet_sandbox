class rabbitmq::config inherits rabbitmq {

  file {'/etc/rabbitmq/enabled_plugins':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => inline_template('[<%= @enabled_plugins.join(",") %>].'),
  }

  file {'/etc/rabbitmq/rabbitmq.conf':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('rabbitmq/rabbitmq.conf.erb'),
  }

  file {'/etc/rabbitmq/rabbitmq.conf.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

  file {'/etc/rabbitmq/rabbitmq-env.conf':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('rabbitmq/rabbitmq-env.conf.erb'),
  }

}
