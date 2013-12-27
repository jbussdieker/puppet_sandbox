define rabbitmq::permission($path, $user, $configure = ".*", $write = ".*", $read = ".*") {

  Exec {
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    require => Rabbitmq::User[$user],
  }

  exec { "rabbitmq_permission_${user}_${path}_set_permissions":
    command => "rabbitmqctl set_permissions -p $path $user \"${configure}\" \"${write}\" \"${read}\"",
    onlyif  => "test `/usr/sbin/rabbitmqctl list_user_permissions $user | grep -c \"^$path\\s$configure\\s$write\\s$read$\"` -lt 1",
  }

}
