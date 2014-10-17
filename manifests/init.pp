class sensu ($interval="10"){

  include sens::repository
  include sens::packages

  Class['sensu::repository']->Class['sensu::packages']

}
