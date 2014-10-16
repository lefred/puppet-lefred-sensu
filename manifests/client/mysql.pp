class sensu::client::mysql ($username=root, $sensu_interval=$sensu::interval, $password) {

  $sensu_mysql_username = $username
  $sensu_mysql_password = $password

  file {
        "/etc/sensu/plugins/mysql-graphite.rb":
		ensure  => present,
                source  => "puppet:///modules/sensu/plugins/mysql-graphite.rb",
		require => Class['sensu::client'];
        "/etc/sensu/conf.d/mysql.json":
                ensure  => present,
                content => template("sensu/mysql.json.erb");
  }


}

