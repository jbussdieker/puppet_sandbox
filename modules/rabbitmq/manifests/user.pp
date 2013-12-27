define rabbitmq::user($password, $tags = "") {

  Exec {
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    require => Class['rabbitmq::service'],
  }

  exec { "rabbitmq_user_${name}_create_user":
    command => "rabbitmqctl add_user $name $password",
    onlyif  => "test `/usr/sbin/rabbitmqctl list_users | grep -c \"^${name}\\s\\[\\w*\\]\"` -lt 1",
  }

  exec { "rabbitmq_user_${name}_set_user_tags":
    command => "rabbitmqctl set_user_tags $name $tags",
    onlyif  => "test `/usr/sbin/rabbitmqctl list_users | grep -c \"^${name}\\s\\[${tags}\\]\"` -lt 1",
  }

}
