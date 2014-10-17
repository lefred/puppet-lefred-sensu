class sensu::server::service {

   service {
	"sensu-server":
		 enable => true,
		 ensure => running,
		 subscribe => File["/etc/sensu/conf.d/relay.json"] 
   }

}
