require 'spec_helper'

describe 'confluent::restservice::install' do

  context 'with default values do' do

    it { should contain_class('confluent::restservice::install') }
    it { should contain_package('confluent-kafka-rest') }

  end

end

