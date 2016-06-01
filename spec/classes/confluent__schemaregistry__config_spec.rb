require 'spec_helper'

describe 'confluent::schemaregistry::config' do

  context 'with default values do' do

    it { should contain_class('confluent::schemaregistry::config') }

  end

end

