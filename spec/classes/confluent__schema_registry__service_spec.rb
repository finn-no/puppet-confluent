require 'spec_helper'

describe 'confluent::schema_registry::service' do

  context 'with default values do' do

    let(:parser) { 'future' }
    it { should contain_class('confluent::schema_registry::service') }
    it { should contain_file('/etc/init.d/kafka-schema_registry') }
    it { should contain_service('kafka-schema_registry') }

  end

end

