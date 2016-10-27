#

class ca {

  file {'/usr/local/share/ca-certificates':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => true,
    recurse => true,
    source  => 'puppet:///modules/ca/ca/'
  }

  exec { '/usr/sbin/update-ca-certificates':
    refreshonly => true,
    subscribe   => File['/usr/local/share/ca-certificates']
  }
}
