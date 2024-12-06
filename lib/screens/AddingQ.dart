import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddingScreen extends StatefulWidget {
  const AddingScreen({super.key});

  @override
  State<AddingScreen> createState() => _AddingScreenState();
}

class _AddingScreenState extends State<AddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final regNumberController = TextEditingController();
  final bagsQuantityController = TextEditingController();
  final netWeightController = TextEditingController();

  void submitData() {
    if (_formKey.currentState!.validate()) {
      // Process the data (e.g., save to Firebase here)
      String regNumber = regNumberController.text.trim();
      String bagsQuantity = bagsQuantityController.text.trim();
      String netWeight = netWeightController.text.trim();

      // TODO: Add Firebase integration here to save the data

      Fluttertoast.showToast(msg: "Data submitted successfully!");

      // Navigate back to the profile screen
      Navigator.pushReplacementNamed(context, '/profile');
    } else {
      Fluttertoast.showToast(msg: "Please complete the form correctly.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensures minimal size for vertical centering
              children: [
                // Reg Number Field
                TextFormField(
                  controller: regNumberController,
                  decoration: InputDecoration(
                    labelText: 'Reg Number',
                    hintText: 'Enter Registration Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Reg Number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Bags Quantity Field
                TextFormField(
                  controller: bagsQuantityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Bags Quantity',
                    hintText: 'Enter number of bags',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bags Quantity is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Net Weight Field
                TextFormField(
                  controller: netWeightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Net Weight',
                    hintText: 'Enter net weight (in kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Net Weight is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: submitData,
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
