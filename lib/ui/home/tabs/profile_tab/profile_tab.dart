import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/login/login_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/settings/settings_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custome_text_field_item.dart';
import '../../../utils/dialog_utils.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

class ProfileTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          MyAssets.logo,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 150.w,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(SettingsScreen.routeName);
                            },
                            icon: Icon(
                              Icons.settings,
                              color: AppColors.primaryColor,
                            )),
                        IconButton(
                            onPressed: () {
                              SharedPreference.removeData(key: 'Token');
                              //todo: back to login
                              DialogUtils.showLoading(
                                  context, appLocalizations!.loading);
                              Timer(Duration(seconds: 2), () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    LoginScreen.routeName, (route) => false);
                              });
                            },
                            icon: Icon(
                              Icons.logout,
                              color: AppColors.primaryColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      appLocalizations!.welcome,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    // Text(
                    //   "Mariam@gmail.com",
                    //   style: TextStyle(color: AppColors.blueGreyColor),
                    // ),
                    // SizedBox(
                    //   height: 40.h,
                    // ),
                    CustomTextFieldItem(
                      fieldName: appLocalizations!.your_full_name,
                      hintText: appLocalizations.full_name,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return appLocalizations.please_enter_full_name;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: appLocalizations.your_email,
                      hintText: appLocalizations.e_mail,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return appLocalizations.please_enter_email;
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: appLocalizations.your_password,
                      hintText: '********',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return appLocalizations.error_password;
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 30) {
                          return appLocalizations.password_should;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: appLocalizations.your_mobile,
                      hintText: '01012345678',
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return appLocalizations.please_enter_mobile;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: appLocalizations.your_address,
                      hintText: appLocalizations.address,
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return appLocalizations.please_enter_address;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
