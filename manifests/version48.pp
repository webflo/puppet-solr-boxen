# Installs Solr 4.8 via Homebrew.
#
# Usage:
#
#     include solr::version48
class solr::version48 {
  solr::install { 'Solr 4.8':
    version => '4.8',
    package_name => 'solr48',
    package_version => '4.8.1-boxen2',
    port => 18986
  }
}
