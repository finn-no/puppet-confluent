require 'spec_helper'

describe 'confluent::kafka_rest::install' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka_rest::install') }
    it { should contain_package('confluent-kafka-rest') }

  end

end

