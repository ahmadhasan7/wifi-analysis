import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/router/app_routes.dart';
import '../../../common/theme/app_colors.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
              width: double.infinity,
            ),
            GestureDetector(
              onTap: () {
                controller.scan();
              },
              child: Container(
                width: 100.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Text("Scan"),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Obx(() {
              switch (controller.isScanning.value) {
                case true:
                  return Center(
                    child: Image.asset(
                      "assets/gifs/loading.gif",
                    ),
                  );
                case false:
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.accessPoints.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Get.toNamed(AppRoutes.details,
                              arguments: controller.accessPoints[index]);
                        },
                        leading: Icon(
                          Icons.wifi,
                          size: 30.sp,
                        ),
                        title: Text(controller.accessPoints[index].ssid),
                        subtitle: Text(controller.accessPoints[index].bssid),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      );
                    },
                  );
                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
