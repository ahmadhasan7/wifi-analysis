import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
                width: double.infinity,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20.w),
                child: Hero(
                  tag: "image",
                  child: SvgPicture.asset(
                    "assets/images/register.svg",
                    height: 300.h,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Color.fromARGB(255, 5, 13, 126)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Please Create an account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 13, 126)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: controller.nameController,
                hintText: "Name",
                icon: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
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
              CustomButton(title: "Sign Up", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
