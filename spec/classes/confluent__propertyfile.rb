require 'spec_helper'

describe 'confluent::propertyfile' do

  context 'with default values for all parameters' do

    it { should contain_class('confluent::propertyfile') }

  end

end
