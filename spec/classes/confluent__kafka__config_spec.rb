require 'spec_helper'

describe 'confluent::kafka::config' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka::config') }

  end

end

