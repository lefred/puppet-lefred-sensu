class sensu::server {

  
  include sensu::config
  include sensu::service

  Class['sensu::repository']->Class['sensu::packages']->Class['sensu::config']->Class['sensu::service']

}
