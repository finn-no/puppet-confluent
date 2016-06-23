require 'spec_helper'

describe 'confluent::repo::apt' do
  context 'with default values for all parameters' do

    let(:parser) { 'future' }
    let(:facts) { { 
      :osfamily => 'Debian',
    }}

    it { should contain_class('confluent::repo::apt') }
    it { should contain_apt__key('confluent') }
    it { should contain_exec('repo update') }
    it { should contain_file('/etc/apt/sources.list.d/confluent.list') }

  end

end
