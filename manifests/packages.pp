class sensu::packages {

    case $::osfamily {
	'RedHat': {
		$require = Yumrepo['sensu']
	}
	'Debian': {
		$require = Apt::Source['sensu']
	}
}

   package {
	"sensu":
		require => $require,
		ensure => "latest"; 
   }

}

