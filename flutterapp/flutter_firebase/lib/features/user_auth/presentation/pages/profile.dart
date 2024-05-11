import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc('user_id') // Replace 'user_id' with actual user ID
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No Data Available'),
            );
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userData == null) {
            return Center(
              child: Text('No User Data Available'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Username: ${userData['username']}'),
              ),
              ListTile(
                title: Text('Name: ${userData['fullname']}'),
              ),
              ListTile(
                title: Text('Email: ${userData['email']}'),
              ),
              ListTile(
                title: Text('Allergies: ${userData['allergies']}'),
              ),
              ListTile(
                title: Text('Age: ${userData['age']}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
