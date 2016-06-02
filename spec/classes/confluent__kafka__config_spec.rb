require 'spec_helper'

describe 'confluent::kafka::config' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka::config') }
    it { should contain_confluent__propertyfile('/etc/kafka/server.properties') }


  end

end

