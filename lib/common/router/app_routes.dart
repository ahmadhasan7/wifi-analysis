import 'package:get/get.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/login/pages/login_page.dart';
import '../../features/network_details/pages/network_details_page.dart';
import '../../features/networksecuritydetails/pages/networksecurityscreen.dart';
import '../../features/signup/pages/signup_page.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const details = '/details';
  static const networksecuritydetails='/networksecuritydetails';
  static List<GetPage> pages = [
    GetPage(name: networksecuritydetails, page:()=>NetworkSecurityScreen()),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
    GetPage(
      name: signup,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: details,
      page: () => NetworkDetailsPage(),
    ),
  ];
}
