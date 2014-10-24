require 'formula'

class Solr48 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'https://archive.apache.org/dist/lucene/solr/4.8.1/solr-4.8.1.tgz'
  sha1 '186885be34f8e0ad7dd6e7d6c572d5e80e2d236d'

  version '4.8.1-boxen2'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr48 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr48').write script
    (var+'logs'+name).mkpath
  end
end
