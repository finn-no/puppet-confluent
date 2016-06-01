require 'spec_helper'

describe 'confluent::schemaregistry::install' do

  context 'with default values do' do

    it { should contain_class('confluent::schemaregistry::install') }
    it { should contain_package('confluent-schema-registry') }

  end

end

