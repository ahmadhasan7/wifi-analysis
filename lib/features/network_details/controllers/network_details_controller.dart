import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';
import '../../../common/enums/network_level.dart';
import '../../../common/router/app_routes.dart';
import '../../functions/fakeOrNo.dart';

class NetworkDetailsController extends GetxController {
  WiFiAccessPoint? network;
  NetworkLevel? level;
  TextEditingController passwordController = TextEditingController();
  RxBool canConnect = false.obs;
  RxBool isConnecting = false.obs;
  bool ISWPA3 = false;
  String? analyzeWiFi;
  String? strength;
  bool isfake = false;
  bool isWpa3OrIsWpa2 = false;
  bool successconnect = false;

  chechIfIslackofupdates() {
    if (network!.capabilities.contains("WPA3") ||
        network!.capabilities.contains("WPA2") ||
        network!.capabilities.contains("Wpa2") ||
        network!.capabilities.contains("Wpa3")) {
      isWpa3OrIsWpa2 = false;
      update();
    }
  }

  checkifIsWPA3() {
    if (network!.capabilities.contains("WPA3")) {
      ISWPA3 = true;
      update();
    }
  }

  connect() async {
    isConnecting(true);
    final result = await WiFiForIoTPlugin.connect(
      network!.ssid,
      password: passwordController.text,
      security: NetworkSecurity.WPA,
      bssid: network!.bssid,
    );

    if (result!) {
      _checkPasswordStrength(passwordController.text);
      CheckFackNetwork();
      successconnect = true;
      update();
      Get.snackbar("Success", "Connected Successfully");
    } else {
      Get.snackbar("Error", "Error Connecting");
    }
  }

  void _checkPasswordStrength(String password) {
    bool lengthCriteria = password.length >= 8;
    bool uppercaseCriteria = false;
    bool lowercaseCriteria = false;
    bool digitCriteria = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].toUpperCase() != password[i]) {
        lowercaseCriteria = true;
      }
      if (password[i].toLowerCase() != password[i]) {
        uppercaseCriteria = true;
      }
      if (password[i].contains(RegExp(r'\d'))) {
        digitCriteria = true;
      }
    }

    if (lengthCriteria &&
        uppercaseCriteria &&
        lowercaseCriteria &&
        digitCriteria) {
      strength = 'Strong';
      update();
    } else {
      strength = 'weak';
    }
  }

  afterconnect() async {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Center(
              child: Text(
                "NetworkDetails",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
            Row(
              children: [
                Text(
                  "Fake Network?",
                ),
                isfake
                    ? Text("Yes", style: TextStyle(color: Colors.black26))
                    : Text("No", style: TextStyle(color: Colors.black26))
              ],
            ),
            Row(
              children: [
                Text("WPA?:"),
                ISWPA3
                    ? Text(
                        'Wi-Fi network was using WPA3 and modified to use WPA2',
                        style: TextStyle(color: Colors.black26),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2)
                    : Text('Wi-Fi network is not using WPA3',
                        style: TextStyle(color: Colors.black26),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2),
              ],
            ),
            Row(
              children: [
                Text("Wi-Fi network is lack of updates:"),
                isWpa3OrIsWpa2
                    ? Text('NO',
                        style: TextStyle(color: Colors.black26),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2)
                    : Text('Yes',
                        style: TextStyle(color: Colors.black26),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2),
              ],
            ),
            Row(
              children: [
                Text("Password Details: "),
                Text(strength.toString(),
                    style: TextStyle(color: Colors.black26))
              ],
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.home);
                },
                child: Text("cancel")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.networksecuritydetails, arguments: {
                    "isfake": isfake,
                    "strength": strength,
                    "userpassword": passwordController.text,
                    "isWpa3OrIsWpa2": isWpa3OrIsWpa2,
                    "ISWPA3": ISWPA3
                  });
                },
                child: Text("To Help Protect Your Network"))
          ],
        ),
      ),
      isDismissible: true,
      backgroundColor: Colors.white,
      elevation: 10.0,
    );
  }

  CheckFackNetwork() async {
    if (await checkInternet()) {
      isfake = false;
      update();
    }
  }

  @override
  void onInit() {
    network = Get.arguments;
    chechIfIslackofupdates();
    checkifIsWPA3();
    level = getNetworkLevel(network!.level);
    super.onInit();
  }
}
