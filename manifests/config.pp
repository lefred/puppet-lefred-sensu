class sensu::config {

  $graphite_host  = $sensu::graphite_host
  $graphite_port  = $sensu::graphite_port
  $sensu_interval = $sensu::sensu_interval

  file {
	"/etc/sensu/conf.d/relay.json":
		ensure  => present,
		content => template("sensu/relay.json.erb");
  }

}
