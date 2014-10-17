class sensu::server::config {

  $graphite_host  = $sensu::server::graphite_host
  $graphite_port  = $sensu::server::graphite_port
  $sensu_interval = $sensu::interval

  file {
	"/etc/sensu/conf.d/relay.json":
		ensure  => present,
		content => template("sensu/relay.json.erb");
		ensure 	=> present,
    	"/etc/sensu/extensions/handlers/":
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/handlers/";
 	"/etc/sensu/extensions/mutators/":
		ensure 	=> present,
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/mutators/";
  }

}