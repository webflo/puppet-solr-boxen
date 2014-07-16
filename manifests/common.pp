# Common solr directories.
#
# Usage:
#
#     include solr::common
class solr::common {
  file { [
    "/opt/boxen/log/solr",
    "/opt/boxen/data/solr",
    ]:
    ensure => 'directory'
  }
}
