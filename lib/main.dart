import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tea_trover_driver/screens/AddingQ.dart';
import 'package:tea_trover_driver/screens/CollectionDeatails.dart';
import 'package:tea_trover_driver/screens/bottomNavigationBar.dart';
import 'package:tea_trover_driver/screens/homeScreen.dart';
import 'package:tea_trover_driver/screens/otpScreen.dart';
import 'package:tea_trover_driver/screens/phoneNumberVerification.dart';
import 'package:tea_trover_driver/screens/profile.dart';
import 'package:tea_trover_driver/screens/profileDetails.dart';

import 'screens/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyADUo4W_FXhQAl2BB50TJasTIPZafcMct0",
        appId: "1:6460420556:android:d015b80ea8cdad5d5aad69",
        messagingSenderId: "6460420556",
        projectId: "teatrove-358f5",
        databaseURL: 'https://teatrove-358f5-default-rtdb.firebaseio.com',
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tea Trover Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Wrapper (),
    );
  }
}