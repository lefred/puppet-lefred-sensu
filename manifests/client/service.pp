class sensu::client::service {

   service {
	"sensu-client":
		 enable => true,
		 ensure => running,
		 subscribe => File["/etc/sensu/conf.d/client.json"] 
   }

}
