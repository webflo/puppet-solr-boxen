require 'formula'

class Solr410 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'https://archive.apache.org/dist/lucene/solr/4.10.2/solr-4.10.2.tgz'
  sha1 'b913204d07212d7bb814afe4641992f22404a27d'

  version '4.10.2-boxen1'

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
