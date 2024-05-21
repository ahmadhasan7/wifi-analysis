import 'package:get/get.dart';
import 'package:wifi_scan/wifi_scan.dart';

class HomeController extends GetxController {
  RxBool isScanning = false.obs;
  List<WiFiAccessPoint> accessPoints = [];

  _startScan() async {
    final can = await WiFiScan.instance.canStartScan(askPermissions: true);
    if (can == CanStartScan.yes) {
      await WiFiScan.instance.startScan();
    } else {
      Get.snackbar("Error", "Error Scanning, Please Turn On Location and  Try Again");
      print("Error Scanning");
    }
  }

  _getScannedResults() async {
    final can =
        await WiFiScan.instance.canGetScannedResults(askPermissions: true);
    if (can == CanGetScannedResults.yes) {
      accessPoints = await WiFiScan.instance.getScannedResults();
      print(accessPoints);
    }
  }

  scan() async {
    isScanning(true);
    await Future.delayed(Duration(seconds: 3));
    await _startScan();
    await _getScannedResults();
    isScanning(false);
  }

  @override
  Future<void> onInit() async {
    scan();
    super.onInit();
  }
}
