class sensu ($graphite_host="localhost", $graphite_port="2003"){

  include sensu::packages
  include sensu::repository
  include sensu::config
  include sensu::service

  Class['sensu::repository']->Class['sensu::packages']->Class['sensu::config']->Class['sensu::service']

}
