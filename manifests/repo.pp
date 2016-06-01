class confluent::repo {

  case $osfamily {
    'Debian': { include ::confluent::repo::debian }
    default : { fail('This module does not support OS Family $osfamily' ) }
  }

}
