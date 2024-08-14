# 0-strace_is_your_friend.pp

file { '/etc/apache2/conf-available/missing.conf':
  ensure  => file,
  content => 'Your configuration content here',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

exec { 'enable_missing_conf':
  command     => '/usr/sbin/a2enconf missing.conf',
  path        => '/usr/bin:/usr/sbin:/bin:/sbin',
  refreshonly => true,
  subscribes  => File['/etc/apache2/conf-available/missing.conf'],
}

service { 'apache2':
  ensure    => running,
  enable    => true,
  subscribe => Exec['enable_missing_conf'],
}
