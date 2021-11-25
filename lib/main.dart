import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:quikcook/AppThemeNotifier.dart';
import 'package:quikcook/auth/auth_service.dart';
import 'package:quikcook/full_app.dart';
// import 'package:quikcook/themes/app_theme_notifier.dart';

import './splash_screen.dart';
import 'package:flutx/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // runApp(
  //   ChangeNotifierProvider<AppThemeNotifier>(
  //     create: (context) => AppThemeNotifier(),
  //     child: ChangeNotifierProvider<FxAppThemeNotifier>(
  //       create: (context) => FxAppThemeNotifier(),
  //       child: MyApp(),
  //     ),
  //   ),
  // );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FxAppTheme.getThemeFromThemeMode(),
        // home: SplashScreen());
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      print(firebaseUser.email);

      return FullApp();
    } else {
      return SplashScreen();
    }
  }
}
