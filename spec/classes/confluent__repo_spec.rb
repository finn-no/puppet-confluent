require 'spec_helper'

describe 'confluent::repo' do
  context 'with default values for all parameters' do

    let(:facts) { { 
      :osfamily => 'Debian',
    }}

    it { should contain_class('confluent::repo') }

  end

end
