# == Class: exim
#
#   This class controls the exim service. This is a private class.
#
class exim::service {
  service { $exim::service_name:
    ensure     => running,
    name       => $exim::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
