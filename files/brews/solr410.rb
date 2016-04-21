require 'formula'

class Solr410 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'https://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz'
  sha1 '0edf666bea51990524e520bdcb811e14b4de4c41'

  version '4.10.4-boxen1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr410 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr410').write script
    (var+'logs'+name).mkpath
  end
end
