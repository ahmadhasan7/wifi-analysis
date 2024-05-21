import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ConnectWithJava {
  static final platform = const MethodChannel("MajdMethodChannel");
  static void printy()async{
    try{
      String? out;
      out=await platform.invokeMethod("Printy");
      print(out);}catch(e){print(e);}
  }

  scanWiFiNetworks() async {
    try {
      String? networksOutput;
      networksOutput= await platform.invokeMethod("scanWiFiNetworks");
      print(networksOutput);
    }on PlatformException catch (e) {
      print("Failed to scan networks: '${e.message}'.");
      return [];
    }
  }

  static Future<List<Map<String, String>>> parseNetworks() async {
    try {
      final Map<String, dynamic> result =
      await platform.invokeMethod('parseNetworks');
      List<Map<String, String>> networkList = [];
      for (var network in result['networks']) {
        networkList.add({
          'ssid': network[0],
          'signal': network[1],
        });
      }
      return networkList;
    } on PlatformException catch (e) {
      print("Failed to parse networks: '${e.message}'.");
      return [];
    }
  }

  static Future<String> analyzeWiFiNetwork(String networkSSID) async {
    try {
      final String securityInfo =
      await platform.invokeMethod('analyzeWiFiNetwork', {'networkSSID': networkSSID});
      return securityInfo;
    } on PlatformException catch (e) {
      print("Failed to analyze WiFi network: '${e.message}'.");
      return "";
    }
  }
  static Future<List<String>> parseSecurityInfo(String securityInfo) async {
    try {
      final List<dynamic> result = await platform.invokeMethod('parseSecurityInfo', {'securityInfo': securityInfo});
      return result.cast<String>();
    } on PlatformException catch (e) {
      print("Failed to parse security info: '${e.message}'.");
      return [];
    }
  }
  static Future<int> testPasswordStrength(String password) async {
    try {
      final int score = await platform.invokeMethod('testPasswordStrength', {'password': password});
      return score;
    } on PlatformException catch (e) {
      print("Failed to test password strength: '${e.message}'.");
      return 0;
    }
  }
}
