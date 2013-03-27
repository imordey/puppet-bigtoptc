class puppet-bigtoptc::forrest{

  file{ '/tmp/apache-forrest-0.9-sources.tar.gz':
    source => 'puppet:///modules/puppet-bigtoptc/apache-forrest-0.9-sources.tar.gz',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755
  }

  exec{'/bin/tar xvzf /tmp/apache-forrest-0.9-sources.tar.gz':
    cwd         => '/usr/local',
    refreshonly => true,
    subscribe   => File["/tmp/apache-forrest-0.9-sources.tar.gz"],
  }

  file { '/tmp/apache-forrest-0.9-dependencies.tar.gz':
    source =>'puppet:///modules/puppet-bigtoptc/apache-forrest-0.9-dependencies.tar.gz',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755
  }

  exec {'/bin/tar xvzf /tmp/apache-forrest-0.9-dependencies.tar.gz':
    cwd         => '/usr/local',
    refreshonly => true,
    subscribe   => File["/tmp/apache-forrest-0.9-dependencies.tar.gz"],
  }

  file { '/usr/local/apache-forrest':
    ensure  => link,
    target  => '/usr/local/apache-forrest-0.9',
    require => Exec['/bin/tar xvzf /tmp/apache-forrest-0.9-dependencies.tar.gz'],
  }
}
