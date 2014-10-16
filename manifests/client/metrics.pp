class sensu::client::galera ($sensu_interval=$sensu::sensu_interval) {

  $sensu_interval = $sensu_interval

  file {
        "/etc/sensu/conf.d/metrics.json":
                ensure  => present,
                content => template("sensu/metrics.json.erb");
        "/etc/sensu/plugins/load-metrics.rb":
                ensure  => present,
                source  => "puppet:///modules/sensu/plugins/load-metrics.rb";


}
