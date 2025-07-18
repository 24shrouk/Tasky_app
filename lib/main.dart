import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_shared_pref.dart';
import 'package:tasky_app/screens/auth/ui/login.dart';
import 'package:tasky_app/screens/home/ui/home_screen.dart';
import 'package:tasky_app/screens/onboard/ui/onboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();
  String routeName = OnBoardScreen.routeName;
  AppSharedPref.getData('id').then((value) {
    if (value != null) {
      routeName = HomeScreen.routeName;
    }
  });
  await Firebase.initializeApp();
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(Tasky(routeName: routeName));
}

class Tasky extends StatelessWidget {
  const Tasky({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnBoardScreen.routeName: (context) => const OnBoardScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
