require 'spec_helper'

describe 'confluent::property' do 

  context 'create test property' do

    let (:title) { 'testkey1' }

    let (:params) {
      {
        'propertyfile' => '/tmp/test.property',
        'component' => 'test',
        'settingshash' => { 'testkey1' => 'testvalue1' },
      }
    }

    it { should contain_ini_setting('test_testkey1') }

  end


end

