require 'formula'

class Solr36 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://archive.apache.org/dist/lucene/solr/3.6.2/apache-solr-3.6.2.tgz'
  sha1 '3a1a40542670ea6efec246a081053732c5503ec1'

  version '3.6.2-boxen1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr36 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr36').write script
    (var+'logs'+name).mkpath
  end
end
