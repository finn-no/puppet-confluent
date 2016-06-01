define confluent::property (
  $propertyfile,
  $component,
  $settingshash,
  $section = "",
) {

  ini_setting { "${component}_${name}":
    setting => $name,
    section => $section,
    value   => $settingshash[$name],
    path    => $propertyfile,
  }

}
