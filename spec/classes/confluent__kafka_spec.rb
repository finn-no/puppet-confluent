require 'spec_helper'

describe 'confluent::kafka' do

  context 'with default values do' do

    it { should contain_class('confluent::kafka') }

  end

end

