class sensu::client::galera {

  $sensu_mysql_username = $username
  $sensu_mysql_password = $password


  file {
        "/etc/sensu/plugins/percona-cluster-metrics.rb":
		ensure  => present,
                source  => "puppet:///modules/sensu/plugins/percona-cluster-metrics.rb",
		require => Class['sensu::client'];
  }

  Class['sensu::client']->Class['sensu::client::galera']

}
