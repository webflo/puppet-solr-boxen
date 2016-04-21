# Installs Solr 4.10 via Homebrew.
#
# Usage:
#
#     include solr::version410
class solr::version410 {
  solr::install { 'Solr 4.10':
    version => '4.10',
    package_name => 'solr410',
    package_version => '4.10.4-boxen1',
    port => 18987
  }
}
