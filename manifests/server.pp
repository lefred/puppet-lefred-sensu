class sensu::server ($redis_host="localhost", $graphite_host="localhost", $graphite_port="2003") {

  include sensu::server::config
  include sensu::server::service

  Class['sensu']->Class['sensu::server::config']->Class['sensu::server::service']

}
