class sensu::repository {

   case $::osfamily {
	'RedHat': {
		yumrepo {
			"sensu":
				descr    => "Sensu",
				enabled  => 1,
				baseurl  => "http://repos.sensuapp.org/yum/el/$releasever/$basearch/",
				gpgcheck => 0;
		}
	}
	'Debian': {
		include ::apt
		apt::source {
			"sensu":
				location	=> "http://repos.sensuapp.org/apt",
				release		=> "sensu",
				repos		=> "main",
				key		=> "7580C77F",
				key_source	=> "http://repos.sensuapp.org/apt/pubkey.gpg",
				include_src	=> false
		}
	}	
   }
}
