import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/router/app_routes.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../functions/methodchaneel.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put<LoginController>(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                width: double.infinity,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20.w),
                child: Hero(
                  tag: "image",
                  child: SvgPicture.asset(
                    "assets/images/login.svg",
                    height: 300.h,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Log In",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Color.fromARGB(255, 5, 13, 126)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Please Log In to continue",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 13, 126)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: controller.emailController,
                hintText: "Email",
                icon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                icon: Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                  title: "Log In",
                  onTap: () {
                    ConnectWithJava.printy();
                    Get.offAllNamed(AppRoutes.home);
                  }),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don`t have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey),
                      children: [
                    TextSpan(
                        text: " Sign Up",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.signup);
                          },
                        style: Theme.of(context).textTheme.labelMedium),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
