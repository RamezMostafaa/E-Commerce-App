import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/register_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/register/cubit/states.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  void register() async {
    // register
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);
    either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
        (response) => emit(RegisterSuccessState(authResultEntity: response)));
  }
}
