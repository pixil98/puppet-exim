class exim (
  # Installer
  String                     $package_name,
  String                     $package_ensure,
  Boolean                    $package_manage,
  # Service
  String                     $service_name,
  # Configuration
  Stdlib::Absolutepath       $config_dir,
  Exim::Config_type          $config_type,
  String                     $local_delivery,
  Array[Stdlib::IP::Address] $local_interfaces,
  # Options
  Hash                       $local_options = {},
  ) {
  if !lookup('bind::supported') {
    fail('Exim is not supported on your OS')
  }

  contain exim::install
  contain exim::config
  contain exim::service

  exec {'update-exim4.conf':
    path => ['/usr/sbin', '/usr/bin', '/bin'],
  }

  Class['::exim::install']
  -> Class['::exim::config']
  ~> Exec['update-exim4.conf']
  ~> Class['::exim::service']
}
