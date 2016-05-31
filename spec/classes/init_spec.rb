require 'spec_helper'
describe 'confluent' do
  context 'with default values for all parameters' do
    it { should contain_class('confluent') }
  end
end
