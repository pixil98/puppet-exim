# == Class: exim::config::debian
#
#   This class contains Debian specific configs.
#
class exim::config::debian {
  if $facts['operatingsystem'] != 'debian' {
    fail("Module ${module_name} only supported on Debian.")
  }

  file { '/etc/mailname':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${facts['networking']['fqdn']}\n",
  }

  file { "${exim::config_dir}/update-exim4.conf.conf":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('exim/debian_update-exim4.conf.conf.epp'),
  }


}
