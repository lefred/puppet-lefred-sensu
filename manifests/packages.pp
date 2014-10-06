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

   file {
    	"/etc/sensu/extensions/handlers/":
		ensure 	=> present,
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/handlers/";
 	"/etc/sensu/extensions/mutators/":
		ensure 	=> present,
		recurse	=> true,
		require => Package['sensu'],
		source	=> "puppet:///modules/sensu/mutators/";

   }


}

