# Installs Solr 1.4 via Homebrew.
#
# Usage:
#
#     solr::install { 'Solr 1.4':
#       version => '1.4',
#       package_name => 'solr14',
#       package_version => '1.4.1-boxen1'
#     }
define solr::install($version, $package_name, $package_version, $port) {
  include solr::common
  include homebrew
  include java
  $datadir = "${boxen::config::datadir}/solr/${version}"
  $logdir = "${boxen::config::logdir}/solr/${version}"

  homebrew::formula { "${package_name}":
    source => "puppet:///modules/solr/brews/${package_name}.rb",
    before => Package["boxen/brews/${package_name}"]
  }

  package { "boxen/brews/${package_name}":
    ensure  => "${package_version}",
    require => Class['java']
  }

  file { "/Library/LaunchDaemons/dev.solr.${version}.plist":
    content => template("solr/dev.solr.plist.erb"),
    group   => 'wheel',
    owner   => 'root',
  }

  file { [$datadir, $logdir]:
    ensure => 'directory'
  }

  file { "${datadir}/solr.xml.example":
    content => template("solr/solr.xml.erb"),
    require => File[$datadir]
  }

  service { "dev.solr.${version}":
    ensure    => running,
    subscribe => File["/Library/LaunchDaemons/dev.solr.${version}.plist"],
    require   => Package["boxen/brews/${package_name}"],
  }
}
