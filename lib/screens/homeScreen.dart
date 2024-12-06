import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tea_trover_driver/screens/AddingQ.dart';
import 'package:tea_trover_driver/screens/CollectionDeatails.dart';

import '../controllers/controllers.dart';
import '../global.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Example logout method
  void _logout() {
    Fluttertoast.showToast(
      msg: "You have been logged out.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );

    Navigator.pushReplacementNamed(context, 'phoneNumberVerification'); // Navigate to login
  }

  // Action for "History Of Month" button
  void _onHistoryPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddingScreen(),));

  }

  // Action for "My Bill" button
  void _onMyBillPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDetails (),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Hi, ${userModelCurrrentInfo?.name ?? "User Name"}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(width: 5,),

                    CircleAvatar(backgroundImage: NetworkImage(userModelCurrrentInfo?.profilepic ?? ""),backgroundColor: Colors.white,),
                    SizedBox(width: 5,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onHistoryPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              ),
              child: const Text(
                'Add Collecction',
                style: TextStyle(fontSize: 23),
              ),
            ),
            const SizedBox(height: 15), // Add spacing between buttons
            ElevatedButton(
              onPressed: _onMyBillPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              ),
              child: const Text(
                'Collection Details',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
