#Creates a manifest that kills a process named killmenow
exec { 'killmenow':
  ensure	=>  '/usr/bin/pkill killmenow',
  provider	=>  'shell',
  returns	=>  [0, 1],
 }
