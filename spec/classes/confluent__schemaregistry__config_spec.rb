require 'spec_helper'

describe 'confluent::schemaregistry::config' do

  context 'with default values do' do

    it { should contain_class('confluent::schemaregistry::config') }
    it { should contain_confluent__propertyfile('/etc/schema-registry/schema-registry.properties') }

  end

end

