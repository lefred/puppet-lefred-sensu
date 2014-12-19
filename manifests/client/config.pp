class sensu::client::config {

  $sensu_rabbitmq_host     = $sensu::client::rabbitmq_host
  $sensu_rabbitmq_password = $sensu::client::rabbitmq_password

  file {
        "/etc/sensu/conf.d/client.json":
        	ensure  => present,
 		notify  => Service['sensu-client'],
        	require => Package['sensu'],
        	content => template("sensu/client.json.erb");
	"/etc/sensu/ssl/":
		ensure  => present,
        	recurse => true,
        	require => Package['sensu'],
 		notify  => Service['sensu-client'],
                source  => "puppet:///modules/sensu/ssl/";
	"/etc/sensu/conf.d/rabbitmq.json":
		ensure  => present,
 		notify  => Service['sensu-client'],
        	require => Package['sensu'],
		content => template("sensu/rabbitmq.json.erb");
  }

}
