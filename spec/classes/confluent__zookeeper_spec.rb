require 'spec_helper'

describe 'confluent::zookeeper' do

  context 'with default values do' do

    it { should contain_class('confluent::zookeeper') }

  end

end

