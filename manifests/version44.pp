# Installs Solr 4.4 via Homebrew.
#
# Usage:
#
#     include solr::version44
class solr::version44 {
  solr::install { 'Solr 4.4':
    version => '4.4',
    package_name => 'solr44',
    package_version => '4.4.0-boxen1',
    port => 18985
  }
}
