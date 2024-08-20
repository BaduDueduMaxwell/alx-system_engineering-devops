# Ensure Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled on boot
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
}

# Configure Nginx to listen on port 80 and serve a custom page
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Configure Nginx to redirect /redirect_me to a specific URL with a 301 status code
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Create a template for Nginx configuration
file { '/etc/puppetlabs/puppet/modules/nginx/templates/default.erb':
  ensure  => file,
  content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location = /redirect_me {
        return 301 http://www.example.com;
    }
}
",
  require => Package['nginx'],
}
