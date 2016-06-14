require 'spec_helper'

describe 'confluent::kafka_rest' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka_rest') }

  end

end

