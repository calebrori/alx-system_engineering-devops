#!/usr/bin/env bash
#Script that connects to server without typing a password

file_line{'alias name':
  path => '/etc/ssh/ssh_config',
  line => 'Host 100.26.212.133',
}
file_line{'host name':
  path => '/etc/ssh/ssh_config',
  line => '    HostName 100.26.212.133',
}
file_line{'user name':
  path => '/etc/ssh/ssh_config',
  line => '    User ubuntu',
}
file_line{'identity file':
  path => '/etc/ssh/ssh_config',
  line => '    IdentityFile ~/.ssh/school',
}
file_line{'Turn off passwd authantication':
  path => '/etc/ssh/ssh_config',
  line => '    PasswordAuthentication no',
}
