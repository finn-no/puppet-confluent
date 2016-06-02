require 'spec_helper'

describe 'confluent::repo::debian' do
  context 'with default values for all parameters' do

    it { should contain_class('confluent::repo::debian') }
    it { should contain_exec('confluent apt update') }
    it { should contain_file('/etc/apt/sources.list.d/confluent.list') }
    it { should contain_apt__key('confluent') }

  end

end
