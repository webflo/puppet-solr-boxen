# Installs Solr 3.6 via Homebrew.
#
# Usage:
#
#     include solr::version36
class solr::version36 {
  solr::install { 'Solr 3.6':
    version => '3.6',
    package_name => 'solr36',
    package_version => '3.6.2-boxen1',
    port => 18984
  }
}
