class puppet-bigtoptc::env {
  file { '/etc/profile.d/jenkins.sh':
    source => 'puppet:///modules/puppet-bigtoptc/jenkins.sh',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644,
  }
}
