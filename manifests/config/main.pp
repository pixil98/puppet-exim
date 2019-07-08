# == Class: exim::config::main
#
#   This class configures exim main local options. This is a private class.
#
class exim::config::main {
  $exim_main_conf = "${exim::config_dir}/conf.d/main/00_local-options"
  file { $exim_main_conf:
    ensure  => file,
    content => epp('exim/main_localoptions'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
