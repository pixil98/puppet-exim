# @summary Installs Exim
#
# Installed the Exim package.
#
# @example
#   include exim::install
class exim::install (
  String $package_name = $exim::package_name,
  String $package_ensure = $exim::package_ensure,
  Boolean $package_manage = $exim::package_manage,
) {
  if $package_manage {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
