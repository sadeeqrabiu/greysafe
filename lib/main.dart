import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetest/view/emergency_screen.dart';
import 'package:firebasetest/view/gender_screen.dart';
import 'package:firebasetest/view/info_screen.dart';
import 'package:firebasetest/view/landing_screen.dart';
import 'package:firebasetest/view/register_screen.dart';
import 'package:firebasetest/view/success_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
    );
  }
}
