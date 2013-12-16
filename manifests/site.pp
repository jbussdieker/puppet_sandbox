node default {

  include activemq
  include rsyslog
  include mcollective
  include elasticsearch
  include logstash

  activemq::instance {'main':
    config => template('activemq.xml.erb'),
  }

}
