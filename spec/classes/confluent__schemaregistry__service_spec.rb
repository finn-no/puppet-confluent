require 'spec_helper'

describe 'confluent::schemaregistry::service' do

  context 'with default values do' do

    it { should contain_class('confluent::schemaregistry::service') }
    it { should contain_file('/etc/init.d/kafka-schemaregistry') }
    it { should contain_service('kafka-schemaregistry') }

  end

end

