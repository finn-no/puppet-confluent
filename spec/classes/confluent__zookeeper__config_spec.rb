require 'spec_helper'

describe 'confluent::zookeeper::config' do

  context 'with default values do' do

    it { should contain_class('confluent::zookeeper::config') }
    it { should contain_file('/etc/kafka/zookeeper.properties') }

  end

end

