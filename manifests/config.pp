# == Class: exim
#
#   This class configures exim. This is a private class.
#
class exim::config {

  case $facts['operatingsystem'] {
    'debian':  { include exim::config::debian }
    default : { }
  }
  contain exim::config::main
}
