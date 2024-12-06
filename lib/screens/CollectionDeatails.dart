import 'package:flutter/material.dart';
import 'package:tea_trover_driver/screens/CollectionDeatails.dart'; // Adjust path if necessary

class CollectionDetails extends StatelessWidget {
   CollectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collection Details"),
        backgroundColor: Colors.lightGreen, // Matches the theme
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pops the current screen off the navigation stack
          },
        ),
      ),
      body: Column(
        children: [
          // Circle for total collection
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightGreen,
              ),
              child: Center(
                child: Text(
                  "Total\nCollection 150KG",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          // Date selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: 5, // Number of dates (can be dynamic based on actual data)
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "01 Dec"),
                      Tab(text: "02 Dec"),
                      Tab(text: "03 Dec"),
                      Tab(text: "04 Dec"),
                      Tab(text: "05 Dec"),
                    ],
                  ),
                  Container(
                    height: 400, // Adjust according to content
                    child: TabBarView(
                      children: [
                        // Each tab displays the collection details for that day
                        CollectionListView(day: "01 Dec"),
                        CollectionListView(day: "02 Dec"),
                        CollectionListView(day: "03 Dec"),
                        CollectionListView(day: "04 Dec"),
                        CollectionListView(day: "05 Dec"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionListView extends StatelessWidget {
  final String day;

  const CollectionListView({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // This could be dynamic based on the data
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date: $day",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Register No: R1234${index + 1}"),
                Text("Mobile: 987654321${index}"),
                Text("Bag Quantity: ${index + 2}"),
                Text("Net Weight: ${(index + 1) * 30} KG"),
              ],
            ),
          ),
        );
      },
    );
  }
}
