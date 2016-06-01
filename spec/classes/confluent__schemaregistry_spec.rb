require 'spec_helper'

describe 'confluent::schemaregistry' do

  context 'with default values do' do

    it { should contain_class('confluent::schemaregistry') }

  end

end

