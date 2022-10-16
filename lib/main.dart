import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/cubits/challenge/cubit.dart';
import 'package:walking_tales/cubits/domain/cubit.dart';
import 'package:walking_tales/firebase_options.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/screens/challenge_detail/challenge_detail.dart';
import 'package:walking_tales/screens/challenges/challenges.dart';
import 'package:walking_tales/screens/create_challenge/create_challenge.dart';
import 'package:walking_tales/screens/home/home.dart';
import 'package:walking_tales/screens/login/login.dart';
import 'package:walking_tales/screens/register/register.dart';
import 'package:walking_tales/screens/splash/splash.dart';

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
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DomainCubit()),
        BlocProvider(create: (_) => ChallengeCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Walking Tales',
        theme: theme.themeLight,
        initialRoute: AppRoutes.challenges,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.challenges: (context) => const ChallengesScreen(),
          AppRoutes.createChallenge: (context) => const CreateChallengeScreen(),
          AppRoutes.challengeDetail: (context) => const ChallengeDetailScreen(),
        },
      ),
    );
  }
}
