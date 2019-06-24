# @summary A short summary of the purpose of this class
#
# A description of what this class does
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
