class apt_update {
  exec { 'apt_update':
    command => '/usr/bin/apt-get update'
  }
}
