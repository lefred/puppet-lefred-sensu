class sensu::server::config {

  $graphite_host  = $sensu::server::graphite_host
  $graphite_port  = $sensu::server::graphite_port
  $sensu_interval = $sensu::interval
  $sensu_redis_host  = $sensu::server::redis_host
  $sensu_mysql_username = $sensu::server::mysql_monitoring_username
  $sensu_mysql_password = $sensu::server::mysql_monitoring_password

  file {
	"/etc/sensu/conf.d/relay.json":
		ensure  => present,
		content => template("sensu/relay.json.erb");
    	"/etc/sensu/extensions/handlers/":
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/handlers/";
 	"/etc/sensu/extensions/mutators/":
		ensure 	=> present,
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/mutators/";
    	"/etc/sensu/conf.d/redis.json":
        	ensure  => present,
        	notify  => Service['sensu-server'],
        	require => Package['sensu'],
        	content => template("sensu/redis.json.erb");

        "/etc/sensu/conf.d/mysql.json":
                ensure  => present,
                content => template("sensu/mysql.json.erb"),
               	notify  => Service['sensu-server'];

        "/etc/sensu/conf.d/metrics.json":
                ensure  => present,
		content => template("sensu/metrics.json.erb");

        "/etc/sensu/conf.d/galera.json":
                ensure  => present,
                content => template("sensu/galera.json.erb"),
                notify  => Service['sensu-server'];	
  }

}
