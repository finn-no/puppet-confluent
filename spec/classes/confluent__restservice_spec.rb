require 'spec_helper'

describe 'confluent::restservice' do

  context 'with default values do' do

    it { should contain_class('confluent::restservice') }

  end

end

