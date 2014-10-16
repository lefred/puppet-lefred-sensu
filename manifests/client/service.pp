class sensu::client::service {

   service {
	"sensu-cwclientserver":
		 enable => true,
		 ensure => running,
		 subscribe => File["/etc/sensu/conf.d/client.json"] 
   }

}
