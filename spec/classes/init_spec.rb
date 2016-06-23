require 'spec_helper'

describe 'confluent' do
  context 'with default values for all parameters' do

    it do 
      expect { 
        is_expected.to raise_error(Puppet::Error)
      }
    end
  end

  context 'installing kafka_server' do

    let(:parser) { 'future' }

    let(:facts) { { 
      :osfamily => 'Debian',
    }}
    let(:params) { { 
      :kafka_server    => true,
    }}

    it { should contain_class('confluent') }
    it { should contain_class('confluent::kafka_server') }
    it { should contain_package('confluent-kafka-2.11') }

  end

end
