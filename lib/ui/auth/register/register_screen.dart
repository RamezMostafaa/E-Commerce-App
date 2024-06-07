import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/di.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/register/cubit/states.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/dialog_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_colors.dart';
import '../../utils/text_field_item.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, appLocalizations!.loading);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: appLocalizations!.error_word);
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.authResultEntity.userEntity?.name ?? "",
              title: appLocalizations!.success);
        }
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    'assets/images/Route.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: appLocalizations!.full_name,
                                hintText: appLocalizations.enter_name,
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return appLocalizations.please_enter_name;
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: appLocalizations.e_mail,
                                hintText: appLocalizations.enter_email,
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return appLocalizations.please_enter_email;
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return appLocalizations.error_email;
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: appLocalizations.password,
                                hintText: appLocalizations.enter_password,
                                controller: viewModel.passwordController,
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
                                keyboardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                fieldName: appLocalizations.confirm_password,
                                hintText: appLocalizations.enter_confirm,
                                controller:
                                    viewModel.confirmationPasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return appLocalizations
                                        .error_confirm_password;
                                  }
                                  if (value !=
                                      viewModel.passwordController.text) {
                                    return appLocalizations
                                        .password_doesnt_match;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                fieldName: appLocalizations.mobile_num,
                                hintText: appLocalizations.enter_mobile,
                                controller: viewModel.phoneController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return appLocalizations.please_enter_mobile;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          child: SizedBox(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                appLocalizations.sign_up,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                              child: Text(
                                appLocalizations.already_acc,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
