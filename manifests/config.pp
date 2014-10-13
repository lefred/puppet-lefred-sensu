class sensu::config {

  $graphite_host  = $sensu::graphite_host
  $graphite_port  = $sensu::graphite_port
  $sensu_interval = $sensu::sensu_interval

  file {
	"/etc/sensu/conf.d/relay.json":
		ensure  => present,
		content => template("sensu/relay.json.erb");
        "/etc/sensu/conf.d/metrics.json":
		ensure  => present,
		source  => template("sensu/metrics.json.erb");
        "/etc/sensu/plugins/load-metrics.rb":
		ensure  => present,
		source  => "puppet:///modules/sensu/plugins/load-metrics.rb";
  }

}
