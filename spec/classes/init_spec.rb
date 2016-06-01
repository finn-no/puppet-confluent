require 'spec_helper'

describe 'confluent' do
  context 'with default values for all parameters' do
    it do 
      expect { 
        is_expected.to raise_error(Puppet::Error, /foo/) 
      }
    end
  end

  context 'installing kafka' do
    let(:params) { { :kafka => true }}

    it { should contain_class('confluent') }
    it { should contain_class('confluent::kafka') }

  end

end
