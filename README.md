puppet-bigtoptc
===============

##BigTop Toolchain Deployment

Puppet module for configuring a CentOS host for building BigTop. It installs:

**Apache Ant 1.9.0**

**Apache Forrest 0.9**

**Oracle JDK 1.6u43**

**Apache Maven 3.0.5**

**Protobuf 2.4.1**

##Usage

These can be indivdually applied using:


	node "node1.example.com" {
	  include puppet-bigtoptc::jdk
	  include puppet-bigtoptc::maven
	  include puppet-bigtoptc::forrest
	  include puppet-bigtoptc::ant
	  include puppet-bigtoptc::protobuf
	  include puppet-bigtoptc::packages
	  include puppet-bigtoptc::env
	  include puppet-bigtoptc::user
	}

Or installed as a whole with:

	node "node2.example.com" {
	  include puppet-bigtoptc::installer
	}

It will create a user jenkins with the required  environment variables set for building BigTop:

	MAVEN_HOME=/usr/local/maven
	PATH=$PATH:$MAVEN_HOME/bin
	JAVA_HOME=/usr/java/latest
	ANT_HOME=/usr/local/ant
	PATH=$PATH:$ANT_HOME/bin
	FORREST_HOME=/usr/local/apache-forrest
	PATH=$PATH:$FORREST_HOME/bin
	
If you do not want to use a puppet master this module can be applied standalone with a command such as:

	puppet apply --modulepath=/root/modules -e "include puppet-bigtoptc::installer"
	
where /root/modules is the directory containing puppet-bigtoptc/

## Requirements

Due to redistribution restrictions the Oracle JDK must be downloaded seperately. 

Download the Java rpm.bin file, run it with the -x switch to extract the rpm file and copy jdk-6u43-linux-amd64.rpm to puppet-bigtoptc/files.

The following files must also be downloaded from their respective mirrors and copied into files/

apache-ant-1.9.0-bin.tar.gz

apache-forrest-0.9-dependencies.tar.gz

apache-forrest-0.9-sources.tar.gz

apache-maven-3.0.5-bin.tar.gz

## Support

License: Apache License, Version 2.0

GitHub URL: https://github.com/imordey/puppet-bigtoptc