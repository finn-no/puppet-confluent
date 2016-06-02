require 'spec_helper'

describe 'confluent::kafka' do

  context 'with default values do' do

    let (:facts) {{ :osfamily => "Debian" }}

    it { should contain_class('confluent::kafka') }

  end

end

