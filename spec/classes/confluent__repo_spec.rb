require 'spec_helper'

describe 'confluent::repo' do

  context 'for debian' do

    let(:parser) { 'future' }
    let (:facts) {{
      'osfamily' => 'Debian',
    }}

    it { should contain_class('confluent::repo') }
    it { should contain_class('confluent::repo::apt') }

  end

  context 'for redhat' do

    let(:parser) { 'future' }
    let (:facts) {{
      'osfamily' => 'RedHat',
    }}

    it { should contain_class('confluent::repo') }
    it { should contain_class('confluent::repo::yum') }

  end


end
