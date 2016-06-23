require 'spec_helper'

describe 'confluent::schema_registry' do

  context 'with default values do' do

    let(:parser) { 'future' }
    it { should contain_class('confluent::schema_registry') }

  end

end

