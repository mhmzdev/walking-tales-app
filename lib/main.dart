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
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/cubits/challenge/cubit.dart';
import 'package:walking_tales/cubits/domain/cubit.dart';
import 'package:walking_tales/screens/challenge_detail/challenge_detail.dart';
import 'package:walking_tales/screens/challenges/challenges.dart';
import 'package:walking_tales/screens/create_challenge/create_challenge.dart';
import 'package:walking_tales/screens/login/login.dart';
import 'package:walking_tales/screens/register/register.dart';
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
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DomainCubit()),
        BlocProvider(create: (_) => ChallengeCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
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
          AppRoutes.leaderBoard: (context) => const LeaderBoardScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.challenges: (context) => const ChallengesScreen(),
          AppRoutes.createChallenge: (context) => const CreateChallengeScreen(),
          AppRoutes.challengeDetail: (context) => const ChallengeDetailScreen(),
        },
      ),
    );
  }
}
