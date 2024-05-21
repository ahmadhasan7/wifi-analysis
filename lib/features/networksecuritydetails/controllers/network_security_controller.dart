import 'package:get/get.dart';

import '../../functions/fakeOrNo.dart';
import '../../network_details/controllers/network_details_controller.dart';

class NetworkSecurityController extends GetxController {
  NetworkDetailsController controller=Get.put(NetworkDetailsController());
  late bool isfake;
  String? strength;
  late String userpassword;
  bool? isWpa3OrIsWpa2;
  bool? ISWPA3;
  late bool  checkifIsWpa;
  late bool weekpassword;
  void checkweekpassword(){
    if(strength=='weak'){
      weekpassword=true;
      update();
    }
  }
  void checkifIsWpa3Or2(){
    if(ISWPA3==false ||isWpa3OrIsWpa2==false){
      checkifIsWpa=true;
      update();
    }
  }

  void createnewpassword() {
    if (userpassword.length < 8) {
      userpassword += '12345678';
      update();
    }
    if(userpassword.contains(RegExp(r'[A-Z]'))){
      userpassword +='a';
      update();
    }
    if(userpassword.contains(RegExp(r'[a-z]'))){
      userpassword +='A';
      update();
    }
    if(userpassword.contains(RegExp(r'\d'))){
      userpassword +='i';
      update();
    }
  }

  @override
  void onInit()async {
    isfake=Get.arguments['isfake'];
    strength = Get.arguments['strength'];
    userpassword = Get.arguments['userpassword'];
    isWpa3OrIsWpa2 = Get.arguments['isWpa3OrIsWpa2'];
    ISWPA3 = Get.arguments['ISWPA3'];
    checkifIsWpa3Or2();
    createnewpassword();
    checkweekpassword();
    super.onInit();
  }
}
