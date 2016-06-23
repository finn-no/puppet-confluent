require 'spec_helper'

describe 'confluent::zookeeper::service' do

  context 'with default values do' do

    let(:parser) { 'future' }
    it { should contain_class('confluent::zookeeper::service') }
    it { should contain_file('/etc/init.d/zookeeper') }
    it { should contain_service('zookeeper') }

  end

end

