#Creates file school inside tmp dir
file { '/tmp/school':
  content =>  'I love Puppet',
  mode    =>  '07744',
  owner   =>  'www-data',
  group   =>  'www-data',
}
