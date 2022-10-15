import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/firebase_options.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walking Tales',
      theme: theme.themeLight,
      initialRoute: AppRoutes.splash,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
      },
    );
  }
}
