class sensu::client::metrics {

  file {
        "/etc/sensu/plugins/load-metrics.rb":
                ensure  => present,
                source  => "puppet:///modules/sensu/plugins/load-metrics.rb",
		        notify  => Service['sensu-client'];
	
  }

  Class['sensu::client']->Class['sensu::client::metrics']

}
