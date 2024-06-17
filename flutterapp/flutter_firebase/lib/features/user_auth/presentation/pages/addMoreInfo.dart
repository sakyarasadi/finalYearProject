import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMoreInfoPage extends StatefulWidget {
  @override
  _AddMoreInfoPageState createState() => _AddMoreInfoPageState();
}

class _AddMoreInfoPageState extends State<AddMoreInfoPage> {
  // Variables to store data
  String patientName = "";
  String medicine = "";
  String dose = "";
  String doctor = "";

  // Function to fetch data from Firestore
  Future<void> fetchData() async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("prescriptions")
          .doc("1rQBel3RRE5qAs5LE3mq")
          .get();

      // Extract data from document
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      setState(() {
        patientName = data['patient_name'] ?? "";
        // If 'medicine' is a list, join its elements into a single string
        if (data['medicine'] is List) {
          medicine = (data['medicine'] as List).join(", ");
        } else {
          // Otherwise, assume it's a string
          medicine = data['medicine'] ?? "";
        }
        dose = data['dose'] ?? "";
        doctor = data['doctor'] ?? "";
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget initializes
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add More Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Patient Name: $patientName'),
            Text('Medicine: $medicine'),
            Text('Dose: $dose'),
            Text('Doctor: $doctor'),
            // Add more widgets for selecting quantity and time
          ],
        ),
      ),
    );
  }
}
