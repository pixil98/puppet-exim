# @summary Installs Exim
#
# Installed the Exim package.
#
# @example
#   include exim::install
class exim::install {
  if $exim::package_manage {
    package { $exim::package_name:
      ensure => $exim::package_ensure,
    }
  }
}
