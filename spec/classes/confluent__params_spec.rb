require 'spec_helper'

describe 'confluent::params' do
  context 'with default values for all parameters' do

    it { should contain_class('confluent::params') }

  end

end
