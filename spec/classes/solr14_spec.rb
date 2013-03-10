require 'spec_helper'

describe 'solr' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'wfarr',
    }
  end

  it do
    should include_class('homebrew')
    should include_class('java')

    should contain_homebrew__formula('solr').with_before('Package[boxen/brews/solr14]')

    should contain_package('boxen/brews/solr14').with({
      :ensure  => '1.4.1-boxen1',
      #:require => 'Class[java]'
    })
  end
end
