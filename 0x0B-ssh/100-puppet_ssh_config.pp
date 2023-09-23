#!/usr/bin/env bash
#Script that connects to server without typing a password

file { 'etc/ssh/ssh_config':
  ensure => present,
 }
 
 file_line { 'Turn off passwd auth':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
 }
 
  file_line { 'Declare identity file':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school'
 }
