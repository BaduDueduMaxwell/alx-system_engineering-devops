# kill process killmenow

exec { 'killmenow':
  command => '/usr/bin/pkill killmenow',
  path    => ['/usr/bin', '/bin'],
  onlyif  => '/bin/pgrep killmenow',
}
