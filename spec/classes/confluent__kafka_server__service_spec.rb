require 'spec_helper'

describe 'confluent::kafka_server::service' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka_server::service') }
    it { should contain_file('/etc/init.d/kafka-server') }
    it { should contain_service('kafka-server') }

  end

end

