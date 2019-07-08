class exim (
  # Installer
  String                        $package_name,
  String                        $package_ensure,
  Boolean                       $package_manage,
  # Service
  String                        $service_name,
  # Configuration
  Stdlib::Absolutepath          $config_dir,
  # Options
  String                        $local_delivery,
  #Boolean                       $enable_tls,
  ) {
  if !lookup('bind::supported') {
    fail('Exim is not supported on your OS')
  }

  contain exim::install
  contain exim::config
  contain exim::service

  Class['::exim::install']
  -> Class['::exim::config']
  ~> Class['::exim::service']
}
