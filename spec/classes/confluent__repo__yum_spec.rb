require 'spec_helper'

describe 'confluent::repo::yum' do
  context 'with default values for all parameters' do

    let(:facts) { { 
      :osfamily => 'RedHat',
    }}

    it { should contain_class('confluent::repo::yum') }
    it { should contain_exec('repo update') }
    it { should contain_file('/etc/yum.repos.d/confluent.repo') }

  end

end
