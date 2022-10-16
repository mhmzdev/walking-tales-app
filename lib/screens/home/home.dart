import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/utils/custom_snackbar.dart';
import 'package:walking_tales/utils/static_utils.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/loader/full_screen_loader.dart';
import 'package:walking_tales/widgets/screen/screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final authCubit = AuthCubit.cubit(context);

    return Screen(
      overlayWidgets: [
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLogoutFailed) {
              CustomSnackBars.failure(context, state.message!);
            } else if (state is AuthLogoutSuccess) {
              Navigator.popAndPushNamed(context, AppRoutes.login);
            }
          },
          builder: (context, state) {
            if (state is AuthLogoutLoading) {
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
          child: Center(
            child: Padding(
              padding: Space.h2,
              child: Column(
                children: [
                  Space.top,
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LinearProgressIndicator();
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                              'Registrations',
                              style: AppText.h2b,
                            ),
                            Space.y1,
                            CircleAvatar(
                              backgroundColor: AppTheme.c.primary,
                              radius: 40.h,
                              child: Text(
                                snapshot.data!.docs.length.toString(),
                                style: AppText.h1b.cl(Colors.white),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return const Text('Something went wrong');
                    },
                  ),
                  Space.y2,
                  Lottie.asset(
                    StaticUtils.shoes2,
                    height: 200.h,
                  ),
                  Text(
                    'Hi! ${authCubit.state.data!.fullName}',
                    style: AppText.h1b.copyWith(
                      color: AppTheme.c.primary,
                      fontSize: AppDimensions.font(13),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Space.y2,
                  Text(
                    'We would like to Thank you for joining us at this very stage! Surely, we are going to ping you for our Beta launch!',
                    style: AppText.b1b.copyWith(
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Space.y2,
                  AppButton(
                    child: Text(
                      'Logout',
                      style: AppText.b1b.cl(Colors.white),
                    ),
                    onPressed: () => authCubit.logout(),
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
