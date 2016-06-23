require 'spec_helper'

describe 'confluent::kafka_rest::config' do

  context 'with default values do' do

    let(:parser) { 'future' }

    it { should contain_class('confluent::kafka_rest::config') }
    it { should contain_confluent__propertyfile('/etc/kafka-rest/kafka-rest.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka-rest/log4j.properties') }

  end

end

