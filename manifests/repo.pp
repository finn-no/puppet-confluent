class confluent::repo {

  case $osfamily {
    'Debian': { include confluent::repo::apt }
    'RedHat': { include confluent::repo::yum }
    default:  { fail("Unsupported osfamily $osfamily") }
  }


}
