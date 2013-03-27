class puppet-bigtoptc::installer {
  include puppet-bigtoptc::jdk
  include puppet-bigtoptc::maven
  include puppet-bigtoptc::forrest
  include puppet-bigtoptc::ant
  include puppet-bigtoptc::protobuf
  include puppet-bigtoptc::packages
  include puppet-bigtoptc::env
  include puppet-bigtoptc::user
}
