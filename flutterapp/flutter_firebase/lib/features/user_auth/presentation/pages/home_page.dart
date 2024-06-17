import 'package:flutter/material.dart';
import 'package:flutter_firebase/Compenents/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add logo and application name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/stat.png',
                      width: 50,
                      height: 50), // Adjust width and height accordingly
                  SizedBox(width: 10),
                  Text(
                    'Medimate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Add cards for prescriptions
            Expanded(
              child: ListView(
                children: [
                  // You can replace the placeholders with actual prescription data
                  buildPrescriptionCard(
                    Image.asset('assets/prescriptionCard.jpg',
                      width: 50,
                      height: 50), // Adjust width and height accordingly
                    'Prescription 1',
                    [
                      'Doctor Name : Janaka Aluthge',
                      'Date : 2021-09-20',
                      'Medicine : Paracetamol 500mg',
                      'Medicine : Piriton 20mg',
                      'Patient Name : Sakya Rasadi',
                    ],
                  ),
                  buildPrescriptionCard(
                    Image.asset('assets/prescriptionCard1.jpg',
                      width: 50,
                      height: 50), // Adjust width and height accordingly
                    'Prescription 2',
                    [
                      'Doctor Name : Janaka Aluthge',
                      'Date : 2021-09-20',
                      'Medicine : Paracetamol 500mg',
                      'Medicine : Piriton 20mg',
                      'Patient Name : Sakya Rasadi',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrescriptionCard(Widget image, String title, List<String> details) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Display details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details.map((detail) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Text(
                  detail,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
