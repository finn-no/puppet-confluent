require 'spec_helper'

describe 'confluent::kafka_rest::service' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka_rest::service') }
    it { should contain_file('/etc/init.d/kafka-rest') }
    it { should contain_service('kafka-rest') }

  end

end

