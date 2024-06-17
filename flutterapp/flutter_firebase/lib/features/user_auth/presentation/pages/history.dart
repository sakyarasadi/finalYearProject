import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: TextStyle(color: Colors.white)), // Example of styling the app bar title
        backgroundColor: Colors.blue, // Example of customizing app bar background color
      ),
      body: PrescriptionList(), // Display the list of prescriptions
    );
  }
}

class PrescriptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('prescriptions').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(), // Show a loading indicator while fetching data
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)), // Example of styling error message text
          );
        }
        return Center(
          child: Container(
            width: 300, // Set width for the ListView
            child: ListView( // Display fetched data in a ListView
              children: snapshot.data!.docs.map((DocumentSnapshot<Map<String, dynamic>> document) {
                Map<String, dynamic> data = document.data()!;
                return Container(
                  width: 100, // Set width for the Card
                  height: 130, // Set height for the Card
                  child: Card(
                    child: Center( // Center the ListTile within the Card
                      child: ListTile(
                        title: Text('Doctor: ${data['doctor']}', style: TextStyle(fontWeight: FontWeight.bold)), // Example of styling doctor text
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Patient Name: ${data['patient_name']}', style: TextStyle(color: Colors.grey)), // Example of styling patient name text
                            Text('Medicine: ${data['medicine']}', style: TextStyle(fontStyle: FontStyle.italic)), // Example of styling medicine text
                            Text('Dose: ${data['dose']}', style: TextStyle(fontWeight: FontWeight.w500)), // Example of styling dose text
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
