class nodejs {
  package { 'curl':
    ensure => installed,
    require => Exec['apt_update'],
  }	

  package { 'git':
    ensure => installed,
    require => Exec['apt_update'],
  }	

  exec { 'update_node_resource':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_4.x | /usr/bin/sudo -E bash -',
    path => '/vagrant/',
    require => [ Package['curl'], Package['git'] ],
  }

  package { "build-essential":
    ensure => installed,
    require => Exec['apt_update'],
  }
 
  package { "nodejs":
    ensure => installed,
    require => Exec['update_node_resource'],
  }
 
  exec { "checkversion" :
    command => "/usr/bin/node --version && /usr/bin/npm --version",
    require => Package['nodejs'],
    logoutput => true,
  }
}
