enum NetworkLevel {
  Excellent,
  VeryGood,
  Okay,
  NotGood,
  Unusable,
}

String getLevelString(NetworkLevel level) {
  switch (level) {
    case NetworkLevel.Excellent:
      return 'Excellent';
    case NetworkLevel.VeryGood:
      return 'Very Good';
    case NetworkLevel.Okay:
      return 'Okay';
    case NetworkLevel.NotGood:
      return 'Not Good';
    case NetworkLevel.Unusable:
      return 'Unusable';
    default:
      return '';
  }
}

NetworkLevel getNetworkLevel(int dBm) {
  if (dBm >= -30) {
    return NetworkLevel.Excellent;
  } else if (dBm >= -67) {
    return NetworkLevel.VeryGood;
  } else if (dBm >= -70) {
    return NetworkLevel.Okay;
  } else if (dBm >= -80) {
    return NetworkLevel.NotGood;
  } else {
    return NetworkLevel.Unusable;
  }
}
