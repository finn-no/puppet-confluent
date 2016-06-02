define confluent::propertyfile (
  $propertyhash,
  $component,
) {

  $keys = keys(merge({}, $propertyhash))

  ::confluent::property { $keys:
    propertyfile => $name,
    component    => $component,
    settingshash => $propertyhash,
  }


}
