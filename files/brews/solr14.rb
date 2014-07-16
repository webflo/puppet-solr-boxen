require 'formula'

class Solr14 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://archive.apache.org/dist/lucene/solr/1.4.1/apache-solr-1.4.1.tgz'
  sha1 'cb5d4066634b329bd90649041724a07263eb9655'

  version '1.4.1-boxen1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr14 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr14').write script
    (var+'logs'+name).mkpath
  end
end
