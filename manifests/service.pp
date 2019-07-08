# == Class: exim
#
#   This class controls the exim service. This is a private class.
#
class exim::service (
  String $service_name = $exim::service_name,
) {
  service { $service_name:
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
