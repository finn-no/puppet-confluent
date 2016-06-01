require 'spec_helper'

describe 'confluent::restservice::config' do

  context 'with default values do' do

    it { should contain_class('confluent::restservice::config') }
    it { should contain_file('/etc/kafka/kafka-rest.properties') }

  end

end

