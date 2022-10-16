import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/cubits/user_stats/cubit.dart';
import 'package:walking_tales/screens/home/widgets/appbar.dart';
import 'package:walking_tales/screens/home/widgets/dash_gauge.dart';
import 'package:walking_tales/screens/home/widgets/dash_stats.dart';
import 'package:walking_tales/screens/home/widgets/weekly_chart.dart';

import '../../widgets/loader/full_screen_loader.dart';
import '../../widgets/screen/screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Screen(
      overlayWidgets: [
        BlocConsumer<UserStatsCubit, UserStatsState>(
          listener: (context, state) {
            if (state is UserStatsFetchFailed) {
              // TODO: Put custom snackbar (Beautiful one),
              // CustomSnackbar.failure(
              //   context,
              //   state.delete!.message!,
              // );
            }
          },
          builder: (context, state) {
            if (state is UserStatsFetchLoading) {
              return const FullScreenLoader(
                loading: true,
              );
            }
            return const SizedBox();
          },
        ),
      ],
      child: Scaffold(body: SafeArea(
        child: BlocBuilder<UserStatsCubit, UserStatsState>(
          builder: (context, state) {
            if (state is UserStatsFetchLoading) {
              return const LinearProgressIndicator();
            } else if (state is UserStatsFetchSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyAppBar(),
                  DashGauge(totalSteps: state.totalSteps),
                  DashStats(state: state),
                  const Expanded(child: WeeklyChart())
                ],
              );
            } else if (state is UserStatsFetchFailed) {
              return Center(
                child: Text(state.message!),
              );
            }
            return const Center(
              child: Text('Something went wrong!'),
            );
          },
        ),
      )),
    );
  }
}
