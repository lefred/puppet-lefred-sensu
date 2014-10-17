class sensu::server ($graphite_host="localhost", $graphite_port="2003") {

  Class['sensu']->Class['sensu::server::config']->Class['sensu::server::service']

}
