node default {

  class {'activemq':
  }

  activemq::instance {'main':
    config => template('activemq.xml.erb'),
  }

  class {'mcollective':
  }

}
