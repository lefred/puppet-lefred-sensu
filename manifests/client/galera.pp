class sensu::client::galera {

  $sensu_host     = $host
  $sensu_port     = $port
  $sensu_username = $username

  file {
        "/etc/sensu/plugins/percona-cluster-metrics.rb":
		ensure  => present,
                source  => "puppet:///modules/sensu/plugins/percona-cluster-metrics.rb",
		require => Class['sensu::client'],
  }


}

define sensu:client:galera_metrics ( $host="127.0.0.1", $port="3306", $username="root", $password ) {



}
