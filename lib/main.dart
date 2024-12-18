import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //unerror will appear here, but it will go as soon as you import the needed Firebase packages
      options: const FirebaseOptions(
          apiKey: "AIzaSyDaP4wzhZDhYhBmVyOISPJeisoOdMNvc8U", //you will find apiKey, appId ... etc indside the google-services.json file that you download from firebase console!
          appId: "223732571114",
          messagingSenderId: "sendid",
          projectId: "fluttering-training",
          storageBucket: "fluttering-training.firebasestorage.app")); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluttering',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: LoginPage()
    );
  }
}
