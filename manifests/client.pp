class sensu::client ($redis_host="localhost", $rabbitmq_host="localhost", $rabbitmq_password=$rabbitmq::config::sensu::rabbitmq_sensu_password) {

  include sensu::client::config
  include sensu::client::service

  package {
	"sensu-plugin":
		ensure   => present,
		provider => gem,
  }

  Class['sensu']->Class['sensu::client::config']->Class['sensu::client::service']

}
