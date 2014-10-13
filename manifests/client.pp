class sensu::client {

  $graphite_host = $sensu::graphite_host
  $graphite_port = $sensu::graphite_port

  include sensu::service

  file {
        "/etc/sensu/conf.d/client.json":
                ensure  => present,
                content => template("sensu/client.json.erb");
  }

  Class['sensu::repository']->Class['sensu::packages']->Class['sensu::service']

}
