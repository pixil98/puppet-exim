# == Class: exim
#
#   This class configures exim. This is a private class.
#
class exim::config {

  contain exim::config::main
}
