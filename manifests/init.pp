# Installs solr via Homebrew.
#
# Usage:
#
#     include solr
class solr {
  include homebrew
  include java

  homebrew::formula { 'solr':
    before => Package['boxen/brews/solr']
  }

  package { 'boxen/brews/solr':
    ensure  => '4.1.0-boxen1',
    require => Class['java']
  }
}

class solr::version14 {
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