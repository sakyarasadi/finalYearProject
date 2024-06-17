import 'package:flutter/material.dart';

class SideEffects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Side Effects of Medicine',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: PrescriptionList(),
    );
  }
}

class PrescriptionList extends StatelessWidget {
  final List<Map<String, String>> hardcodedData = [
    {
      'name': 'Ibuprofen',
      'description':
          'Nonsteroidal anti-inflammatory drug (NSAID) used for pain relief and reducing inflammation. Side effects can include stomach upset, ulcers, and increased risk of bleeding, particularly in the gastrointestinal tract.'
    },
    {
      'name': 'Aspirin',
      'description':
          'Also an NSAID used for pain relief, reducing inflammation, and preventing blood clot formation. Side effects may include stomach irritation, ulcers, and increased bleeding risk, particularly in the gastrointestinal tract. Reye\'s syndrome is a rare but serious side effect in children and teenagers.'
    },
    {
      'name': 'Paracetamol (Acetaminophen)',
      'description':
          'Used for pain relief and reducing fever. Side effects are rare but can include liver damage if taken in large doses.'
    },
    {
      'name': 'Loratadine',
      'description':
          'Antihistamine used to relieve allergy symptoms. Side effects are generally mild and can include headache, drowsiness, and dry mouth.'
    },
    {
      'name': 'Omeprazole',
      'description':
          'Proton pump inhibitor (PPI) used to reduce stomach acid production. Side effects can include headache, nausea, and increased risk of bone fractures.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: ListView.builder(
          itemCount: hardcodedData.length,
          itemBuilder: (context, index) {
            final data = hardcodedData[index];
            return Container(
              width: 100,
              height: 250,
              child: Card(
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Name: ${data['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description: ${data['description']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SideEffects(),
  ));
}
