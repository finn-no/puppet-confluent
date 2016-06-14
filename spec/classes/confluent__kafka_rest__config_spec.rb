require 'spec_helper'

describe 'confluent::restservice::config' do

  context 'with default values do' do

    it { should contain_class('confluent::restservice::config') }
    it { should contain_confluent__propertyfile('/etc/kafka-rest/kafka-rest.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka-rest/log4j.properties') }

  end

end

