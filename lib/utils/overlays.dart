import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/utils/custom_snackbar.dart';
import 'package:walking_tales/widgets/loader/full_screen_loader.dart';

class Overlays {
  static List<Widget> authOverlay() {
    return [
      BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginFailed ||
              state is AuthRegisterFailed ||
              state is AuthLogoutFailed ||
              state is AuthForgotFailed) {
            CustomSnackBars.failure(context, state.message!);
          } else if (state is AuthLoginSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is AuthRegisterSuccess) {
            CustomSnackBars.success(
              context,
              'Account has been created successfully. Please check your email for verification.',
            );
            Navigator.pop(context);
          } else if (state is AuthLogoutSuccess) {
            Navigator.popAndPushNamed(context, AppRoutes.login);
          }
        },
        builder: (context, state) {
          if (state is AuthLoginLoading ||
              state is AuthRegisterLoading ||
              state is AuthLogoutLoading ||
              state is AuthForgotLoading) {
            return const FullScreenLoader(
              loading: true,
            );
          }
          return const SizedBox();
        },
      ),
    ];
  }
}
