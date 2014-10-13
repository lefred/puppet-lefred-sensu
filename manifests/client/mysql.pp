class sensu::client::mysql {

  file {
        "/etc/sensu/plugins/mysql-graphite.rb":
		ensure  => present,
                source  => "puppet:///modules/sensu/plugins/mysql-graphite.rb",
		require => Class['sensu::client'],
  }


}

