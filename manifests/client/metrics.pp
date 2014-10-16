class sensu::client::metrics ($sensu_interval=$sensu::interval) {

  file {
        "/etc/sensu/conf.d/metrics.json":
                ensure  => present,
                content => template("sensu/metrics.json.erb");
        "/etc/sensu/plugins/load-metrics.rb":
                ensure  => present,
                source  => "puppet:///modules/sensu/plugins/load-metrics.rb",
		notify  => Service['sensu-client'];
	
  }

}