require 'spec_helper'

describe 'confluent::propertyfile' do 

  context 'create test propertyfile' do

    let (:title) { '/tmp/test.property' }

    let (:params) {
      {
        'propertyhash' => {
          'testkey1' => 'testvalue1',
        },
        'component' => 'test'
      }
    }

    it { should contain_ini_setting('test_testkey1') }
    it { should contain_confluent__property('testkey1') }
    it { should contain_confluent__propertyfile('/tmp/test.property') }

  end


end

