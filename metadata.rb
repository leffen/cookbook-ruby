name             "ruby"
maintainer       "Cassiano Leal"
maintainer_email "cassianoleal@gmail.com"
license          'Apache 2.0'
description      "Installs and configures a system-wide Ruby, with the option of removing Ruby system packages"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'apt'
depends 'build-essential'
