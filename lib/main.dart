import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/cubits/user_stats/cubit.dart';
import 'package:walking_tales/firebase_options.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/providers/user_location.dart';
import 'package:walking_tales/screens/dashboard/dashboard.dart';
import 'package:walking_tales/screens/home/home.dart';
import 'package:walking_tales/screens/leader_board/leader_board.dart';
import 'package:walking_tales/screens/splash/splash.dart';
import 'package:walking_tales/screens/track_completed/track_completed.dart';
import 'package:walking_tales/screens/tracking/tracking.dart';

import 'configs/core_theme.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => UserStatsCubit()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => UserLocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Walking Tales',
        theme: theme.themeLight,
        initialRoute: AppRoutes.splash,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.tracking: (context) => const TrackingScreen(),
          AppRoutes.dashboard: (context) => const DashboardScreen(),
          AppRoutes.trackCompleted: (context) => const TrackCompletedScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.leaderBoard: (context) => const LeaderBoardScreen()
        },
      ),
    );
  }
}
