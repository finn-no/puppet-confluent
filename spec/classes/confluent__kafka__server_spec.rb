require 'spec_helper'

describe 'confluent::kafka_server' do

  context 'with default values do' do

    let(:parser) { 'future' }
    let (:facts) {{ :osfamily => "Debian" }}

    it { should contain_class('confluent::kafka_server') }

  end

end

