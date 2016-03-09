# Installs Solr 5.5 via Homebrew.
#
# Usage:
#
#     include solr::version44
class solr::version55 {
  solr::install { 'Solr 5.5':
    version => '5.5',
    package_name => 'solr55',
    package_version => '5.5.0-boxen2',
    port => 18988,
    template => 'dev.solr.5.5'
  }
}
