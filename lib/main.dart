import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'common/router/app_routes.dart';
import 'common/theme/theme.dart';
import 'features/functions/methodchaneel.dart';

void main()async {
  await ConnectWithJava.parseNetworks;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => GetMaterialApp(
        builder: (context, child) => SafeArea(child: child!),
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.login,
        defaultTransition: Transition.leftToRightWithFade,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(context),
      ),
    );
  }
}
