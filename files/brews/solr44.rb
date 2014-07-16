require 'formula'

class Solr44 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'https://archive.apache.org/dist/lucene/solr/4.4.0/solr-4.4.0.tgz'
  sha1 '4bd3fe9a5a3c4417fcb551204780d8adafc48b6e'

  version '4.4.0-boxen1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr44 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr44').write script
    (var+'logs'+name).mkpath
  end
end
