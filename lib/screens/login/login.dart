import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/utils/custom_snackbar.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/loader/full_screen_loader.dart';
import 'package:walking_tales/widgets/screen/screen.dart';
import 'package:walking_tales/widgets/text_fields/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final state = AppProvider.state(context);
    final authCubit = AuthCubit.cubit(context);

    return Screen(
      overlayWidgets: [
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginFailed) {
              CustomSnackBars.failure(context, state.message!);
            } else if (state is AuthLoginSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.baseScreen);
            }
          },
          builder: (context, state) {
            if (state is AuthLoginLoading) {
              return const FullScreenLoader(
                loading: true,
              );
            }
            return const SizedBox();
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: Space.all(),
            child: FormBuilder(
              key: state.loginFormState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Space.y2,
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Walking Tales',
                          style: AppText.h1b.copyWith(
                            fontSize: AppDimensions.font(17),
                            color: AppTheme.c.primaryDark,
                          ),
                        ),
                        Text(
                          "Let's get your health back along with some gifts from your favourite brands!",
                          textAlign: TextAlign.center,
                          style: AppText.b2.cl(Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Space.yf(30),
                  Text(
                    'Login',
                    style: AppText.h1b.cl(AppTheme.c.primaryDark!),
                  ),
                  Text(
                    'Please enter the following information',
                    style: AppText.b2,
                  ),
                  Space.y2,
                  CustomTextField(
                    name: 'email',
                    hint: 'Email address',
                    textCapitalization: TextCapitalization.none,
                    prefixIcon: const Icon(Icons.email_outlined),
                    textInputType: TextInputType.emailAddress,
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(
                          errorText: 'Invalid email format'),
                    ]),
                  ),
                  Space.y1,
                  CustomTextField(
                    name: 'password',
                    hint: 'Enter password',
                    isPass: true,
                    prefixIcon: const Icon(Icons.lock_open_rounded),
                    textInputType: TextInputType.text,
                    validators: FormBuilderValidators.required(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: const Text('Forgot password?'),
                      onPressed: () {},
                    ),
                  ),
                  Space.y,
                  AppButton(
                    child: Text(
                      'Login',
                      style: AppText.b1b.cl(Colors.white),
                    ),
                    onPressed: () {
                      if (state.loginFormState.currentState!
                          .saveAndValidate()) {
                        FocusScope.of(context).unfocus();

                        final fields =
                            state.loginFormState.currentState!.fields;

                        final values = fields.map(
                          (key, value) => MapEntry(
                            key,
                            value.value.toString().trim(),
                          ),
                        );
                        authCubit.login(
                          values['email']!,
                          values['password']!,
                        );
                      }
                    },
                  ),
                  Space.xm,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('New Here?'),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.register),
                        child: const Text('Create Account'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
