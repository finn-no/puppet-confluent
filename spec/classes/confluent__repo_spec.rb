require 'spec_helper'

describe 'confluent::repo' do
  context 'with default values for all parameters' do

    let(:facts) { { 
      :osfamily => 'Debian',
    }}

    it { should contain_class('confluent::repo') }
    it { should contain_apt__key('confluent') }
    it { should contain_exec('repo update') }
    it { should contain_file('/etc/apt/sources.list.d/confluent.list') }

  end

end
