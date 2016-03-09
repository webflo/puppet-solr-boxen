require 'formula'

class Solr55 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'https://www.apache.org/dyn/closer.cgi?path=lucene/solr/5.5.0/solr-5.5.0.tgz'
  sha1 'cc71b919282678276a37d393892ade5ce3e10252'

  version '5.5.0-boxen2'

  def install
    libexec.install Dir["*"]
    bin.install "#{libexec}/bin/solr"
    bin.install "#{libexec}/bin/post"
    bin.install "#{libexec}/bin/oom_solr.sh"
    share.install "#{libexec}/bin/solr.in.sh"
    prefix.install "#{libexec}/example"
    prefix.install "#{libexec}/server"

    # Fix the classpath for the post tool
    inreplace "#{bin}/post", '"$SOLR_TIP/dist"', "#{libexec}/dist"

    # Fix the paths in the sample solrconfig.xml files
    Dir.glob(["#{prefix}/example/**/solrconfig.xml",
      "#{prefix}/**/data_driven_schema_configs/**/solrconfig.xml",
      "#{prefix}/**/sample_techproducts_configs/**/solrconfig.xml"]) do |f|
      inreplace f, ":../../../..}/", "}/libexec/"
    end
  end

end
