require 'spec_helper'

describe 'confluent::schema_registry::config' do

  context 'with default values do' do

    it { should contain_class('confluent::schema_registry::config') }
    it { should contain_confluent__propertyfile('/etc/schema-registry/schema-registry.properties') }
    it { should contain_confluent__propertyfile('/etc/schema-registry/log4j.properties') }
    it { should contain_confluent__propertyfile('/etc/schema-registry/connect-avro-distributed.properties') }
    it { should contain_confluent__propertyfile('/etc/schema-registry/connect-avro-standalone.properties') }

  end

end

