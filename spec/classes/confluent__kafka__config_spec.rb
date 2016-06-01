require 'spec_helper'

describe 'confluent::kafka::config' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka::config') }
    it { should contain_file('/etc/kafka/server.properties') }

  end

end

