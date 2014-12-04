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
                content => template("sensu/mysql.json.erb"),
		notify  => Service['sensu-client'];
  }

  case $::osfamily {
        'RedHat': {
        $mysql_version = hiera('mysql::mysql_version', '5.6')
        if $mysql_version == "5.7" {
            $mysql_ver="57"
        } elsif $mysql_version == "5.6" {
            $mysql_ver="56"
        } elsif $mysql_version == "5.5" {
            $mysql_ver="55"
        } elsif $mysql_version == "10" {
            $mysql_ver="10.0"
        }
 
         	package {
			"ruby-devel":
				ensure   => present;
			"mysql2":
                		ensure   => present,
                		provider => gem,
				require  => Package['ruby-devel'];
		}
        }
        'Debian': {
         	package {
			"ruby-mysql2":
                		ensure   => present;
		}
        }
  }

  package {
        "inifile":
                ensure   => present,
                provider => gem;
  }


}

