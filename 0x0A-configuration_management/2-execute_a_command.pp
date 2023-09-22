#Creates a manifest that kills a process named killmenow

exec { 'pkill':
  ensure    =>  '/usr/bin/pkill killmenow',
  provider  =>  'shell',
  returns   =>  [0, 1],
 }
