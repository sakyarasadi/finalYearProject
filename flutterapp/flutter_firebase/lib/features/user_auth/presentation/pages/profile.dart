// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('User')
//             .doc('oxUzdZ1sozL9wYUzdfnrFV7TCf43') // Replace 'user_id' with actual user ID
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (!snapshot.hasData || snapshot.data == null) {
//             return Center(
//               child: Text('No Data Available'),
//             );
//           }

//           var userData = snapshot.data!.data() as Map<String, dynamic>?;

//           if (userData == null) {
//             return Center(
//               child: Text('No User Data Available'),
//             );
//           }

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 title: Text('Username: ${userData['username']}'),
//               ),
//               ListTile(
//                 title: Text('Name: ${userData['fullname']}'),
//               ),
//               ListTile(
//                 title: Text('Email: ${userData['email']}'),
//               ),
//               ListTile(
//                 title: Text('Allergies: ${userData['allergies']}'),
//               ),
//               ListTile(
//                 title: Text('Age: ${userData['age']}'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc('oxUzdZ1sozL9wYUzdfnrFV7TCf43') // Replace 'user_id' with actual user ID
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
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

          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 77,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/user.png'),
                        radius: 75,
                      ),
                    ),
                    // SizedBox(height: 10),
                    // Text(userData['fullname'] ?? "", style: TextStyle(fontSize: 28, color: Colors.white)),
                    // Text(userData['email'] ?? "", style: TextStyle(fontSize: 17, color: Colors.grey)),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.person, size: 30),
                      subtitle: Text("Full name"),
                      title: Text(userData['fullname'] ?? ""),
                    ),
                    ListTile(
                      leading: Icon(Icons.email, size: 30),
                      subtitle: Text("Email"),
                      title: Text(userData['email'] ?? ""),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle, size: 30),
                      subtitle: Text("Username"),
                      title: Text(userData['username'] ?? ""),
                    ),
                     ListTile(
                      leading: Icon(Icons.support_agent_rounded, size: 30),
                      subtitle: Text("Age"),
                      title: Text(userData['age'] ?? ""),
                    ),
                    ListTile(
                      leading: Icon(Icons.health_and_safety, size: 30),
                      subtitle: Text("Allergies"),
                      title: Text(userData['allergies'] ?? ""),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

