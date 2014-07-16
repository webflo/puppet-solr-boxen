# Installs Solr 1.4 via Homebrew.
#
# Usage:
#
#     include solr::version14
class solr::version14 {
  solr::install { 'Solr 1.4':
    version => '1.4',
    package_name => 'solr14',
    package_version => '1.4.1-boxen1',
    port => 18983
  }
}
