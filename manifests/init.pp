# Installs solr via Homebrew.
#
# Usage:
#
#     include solr
class solr {
  include solr::common
  include homebrew
  include java

  homebrew::formula { 'solr': }
  ->
  package { 'boxen/brews/solr':
    ensure  => '4.4.0-boxen1',
    require => Class['java']
  }
}

class solr::version14 {
  include solr::common
  include homebrew
  include java

  homebrew::formula { 'solr14':
    before => Package['boxen/brews/solr14']
  }

  package { 'boxen/brews/solr14':
    ensure  => '1.4.1-boxen1',
    require => Class['java']
  }
}

class solr::version36 {
  include solr::common
  include homebrew
  include java

  $version = "3.6"

  homebrew::formula { 'solr36':
    before => Package['boxen/brews/solr36']
  }

  package { 'boxen/brews/solr36':
    ensure  => '3.6.2-boxen1',
    require => Class['java']
  }

  file { "/Library/LaunchDaemons/dev.solr.${version}.plist":
    content => template("solr/dev.solr.${version}.plist.erb"),
    group   => 'wheel',
    owner   => 'root',
  }

  file { "/opt/boxen/data/solr/3.6":
    ensure => 'directory'
  }

  service { "dev.solr.${version}":
    ensure    => running,
    subscribe => File["/Library/LaunchDaemons/dev.solr.${version}.plist"],
    require   => Package["boxen/brews/solr36"],
  }
}

class solr::common {
  file { [
    "/opt/boxen/log/solr",
    "/opt/boxen/data/solr",
    ]:
    ensure => 'directory'
  }
}
