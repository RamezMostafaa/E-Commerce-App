import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/di.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/login/cubit/states.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/home_screen_view.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/dialog_utils.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_colors.dart';
import '../../utils/text_field_item.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, appLocalizations.loading);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: appLocalizations.error_word);
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.authResultEntity.userEntity?.name ?? '',
              title: appLocalizations.success);
          // save token
          SharedPreference.saveData(
              key: 'Token', value: state.authResultEntity.token);
          Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
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
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    'assets/images/Route.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        appLocalizations!.welcome_back,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        appLocalizations.please_sign,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
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
                            ],
                          ),
                        ),
                      ),
                      Text(
                        appLocalizations.forget_password,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                          onPressed: () {
                            //todo: login
                            viewModel.login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                          child: Container(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                appLocalizations.log_in,
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
                            Text(
                              appLocalizations.dont_have_acc,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text(
                                appLocalizations.create_account,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        ),
                      )
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
