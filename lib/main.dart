import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pepcorns/api_screen.dart';
import 'package:pepcorns/signupScreen.dart';

import 'login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignUpScreen.id,

      routes: {
        LoginScreen.id :(context)=> LoginScreen(),
        SignUpScreen.id : (context) => SignUpScreen(),
        ApiScreen.id : (context) => ApiScreen(),

      },

    );
  }
}
