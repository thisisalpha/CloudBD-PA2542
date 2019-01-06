class mysql_server {
  package { 'mysql-server':
    ensure => installed,
    require => Exec['apt_update'],
  }	

  service { 'mysql':
    enable => true,
    ensure => running,
    require => Package['mysql-server'],
  }

  exec { 'mysqladmin':
    command => '/usr/bin/mysqladmin -u root password CloudDB',
    require => Package['mysql-server'],
  }
}
