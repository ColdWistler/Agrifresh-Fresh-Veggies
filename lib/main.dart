import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with your web config
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBec8kmFRnNOlBIwdOSejy7oeYyofil6PY",
      authDomain: "agrifresh-9e582.firebaseapp.com",
      projectId: "agrifresh-9e582",
      storageBucket: "agrifresh-9e582.firebasestorage.app",
      messagingSenderId: "983702128195",
      appId: "1:983702128195:web:cf9818eff030192d6176f6",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
