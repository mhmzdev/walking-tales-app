import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: Space.all(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Walking Tales',
                style: AppText.h1b.copyWith(
                  color: Colors.white,
                  fontSize: AppDimensions.font(18),
                ),
              ),
              Space.y1,
              ListTile(
                minLeadingWidth: 20,
                leading: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                title: Text(
                  'My Profile',
                  style: AppText.h2.cl(Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Settings',
                  style: AppText.h2.cl(Colors.white),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: const Icon(
                  Icons.widgets,
                  color: Colors.white,
                ),
                title: Text(
                  'Challenges',
                  style: AppText.h2.cl(Colors.white),
                ),
                onTap: () => Navigator.pushNamed(context, AppRoutes.challenges),
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: const Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Diet Recommender',
                  style: AppText.h2.cl(Colors.white),
                ),
                onTap: () => Navigator.pushNamed(context, AppRoutes.fitnessTip),
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLogoutLoading) {
                      return const LinearProgressIndicator();
                    } else if (state is AuthLogoutSuccess) {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                    return Text(
                      'Logout',
                      style: AppText.h2.cl(Colors.white),
                    );
                  },
                ),
                onTap: () {
                  AuthCubit.cubit(context).logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
