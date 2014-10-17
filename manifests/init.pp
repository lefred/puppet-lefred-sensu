class sensu ($interval="10"){

  include sensu::repository
  include sensu::packages

  Class['sensu::repository']->Class['sensu::packages']

}
