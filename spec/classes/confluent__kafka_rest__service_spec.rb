require 'spec_helper'

describe 'confluent::restservice::service' do

  context 'with default values do' do

    it { should contain_class('confluent::restservice::service') }
    it { should contain_file('/etc/init.d/kafka-restservice') }
    it { should contain_service('kafka-restservice') }

  end

end

