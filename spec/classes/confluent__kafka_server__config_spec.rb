require 'spec_helper'

describe 'confluent::kafka_server::config' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka_server::config') }
    it { should contain_confluent__propertyfile('/etc/kafka/server.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/log4j.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-console-sink.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-console-source.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-distributed.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-file-sink.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-file-source.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-log4j.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/connect-standalone.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/consumer.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/producer.properties') }
    it { should contain_confluent__propertyfile('/etc/kafka/tools-log4j.properties') }

  end

end

