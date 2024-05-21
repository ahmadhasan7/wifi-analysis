// import 'package:connectivity/connectivity.dart';
//
// void checkWifiSecurity() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.wifi) {
//     // Connected to a Wi-Fi network, now check security
//     var wifiInfo = await getWifiInfo(); // Implement this method to get Wi-Fi info
//     if (wifiInfo.security == 'WPA2') {
//       // Network is using WPA2, potentially insecure
//       showSecurityWarning();
//     } else if (wifiInfo.security == 'WPA3') {
//       // Network is using WPA3, secure
//       // You can handle this case differently, perhaps by just logging it
//       print('Connected to a WPA3 secured network.');
//     } else {
//       // Unknown security type
//       print('Unknown security type');
//     }
//   }
// }
//
// void showSecurityWarning() {
//   // Implement how you want to alert users about the potential security issue
//   // For example, show a dialog box warning them about connecting to insecure networks.
// }
