import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../home/pages/home_page.dart';
import '../controllers/network_details_controller.dart';
import '../widgets/custom_row.dart';
import '../widgets/network_level_widget.dart';

class NetworkDetailsPage extends StatelessWidget {
  const NetworkDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NetworkDetailsController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.to(HomePage());
          },
          child: Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Text(
          controller.network!.ssid,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70.h,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      body:GetBuilder<NetworkDetailsController>(builder: (controller){return  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 10.h,
              ),
              Icon(
                Icons.wifi,
                size: 35.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                controller.network!.bssid,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomRow(
                title: "Capabilities",
                value: controller.network!.capabilities.substring(30),
              ),
              SizedBox(
                height: 30.h,
              ),
              NetworkLevelWidget(
                level: controller.level!,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomRow(
                  title: "Frequency",
                  value: controller.network!.frequency.toString() + " HZ"),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                controller: controller.passwordController,
                hintText: "Enter Password",
                onChanged: (v) {
                  if (v.length >= 8) {
                    controller.canConnect(true);
                  } else {
                    controller.canConnect(false);
                  }
                },
                icon: Icon(Icons.key_outlined),
              ),
              SizedBox(
                height: 50.h,
              ),
              Obx(() =>
                  CustomButton(
                    title: "Connect",
                    onTap: controller.canConnect.isTrue
                        ? () {
                      controller.connect();
                    }
                        : null,
                  )),
              SizedBox(height: 50.sp,),
              controller.successconnect ?
                  CustomButton(title: "Show Details", onTap: () {
                    controller.afterconnect();
                  }):Container()
            ],
          ),
        ),
      );},)
    );
  }
}
