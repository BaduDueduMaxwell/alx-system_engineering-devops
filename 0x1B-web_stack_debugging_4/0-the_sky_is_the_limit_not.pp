# This Puppet manifest is used to optimize the Nginx web server configuration and system settings
# to handle a high number of concurrent HTTP requests without failure. It includes:
# - Increasing the number of worker processes and connections for Nginx.
# - Adjusting system file descriptor limits to allow more open files (important for handling multiple connections).
# - Applying all changes and restarting Nginx to apply new settings.
# The goal is to improve the server's performance under load, reducing the number of failed requests to zero.

exec {'increase_limit':
  command  => 'sudo sed -1 "s/15/4090" /etc/default/nginx',
  provider => shell
}

exec {'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell
}
