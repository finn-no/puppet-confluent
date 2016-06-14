require 'spec_helper'

describe 'confluent::schema_registry::install' do

  context 'with default values do' do

    it { should contain_class('confluent::schema_registry::install') }
    it { should contain_package('confluent-schema-registry') }

  end

end

