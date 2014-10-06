class sensu::config {

  $graphite_host = $sensu::graphite_host
  $graphite_port = $sensu::graphite_port

  file {
	"/etc/sensu/conf.d/relay.json":
		ensure => present,
		content => template("sensu/relay.json.erb");
  }

}
