require 'spec_helper'

describe 'confluent::defaults' do

  context 'with default values do' do

    it { should contain_class('confluent::defaults') }

  end

end

