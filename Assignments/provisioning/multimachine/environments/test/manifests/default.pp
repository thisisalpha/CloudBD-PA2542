node 'appserver' {
  include apt_update
  include nodejs
}

node 'dbserver' {
  include apt_update
  include mysql_server
}

node 'default' {
}
