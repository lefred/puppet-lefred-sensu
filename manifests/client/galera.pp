class sensu::client::galera ($username=root, $sensu_interval=$sensu::interval, $password) {

  $sensu_mysql_username = $username
  $sensu_mysql_password = $password
  $sensu_interval = $sensu_interval


  file {
        "/etc/sensu/plugins/percona-cluster-metrics.rb":
		ensure  => present,
                source  => "puppet:///modules/sensu/plugins/percona-cluster-metrics.rb",
		require => Class['sensu::client'];
   	"/etc/sensu/conf.d/galera.json":
                ensure  => present,
                content => template("sensu/galera.json.erb");
  }

}
