import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/profile.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/detect_medicine.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/history.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sideEffects.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/addMoreInfo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: [
          // Header
          DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 64,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),

          SizedBox(height: 20),
          // Home List Title
           ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),

          // Profile
           ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),

            //Scan page
            ListTile(
              title: Text('Scan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScanScreen()),
                );
              },
            ),

            // History
            ListTile(
              title: Text('History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
            ),

             // History
            ListTile(
              title: Text('Side Effects'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMoreInfoPage()),
                );
              },
            ),

          // Logout
         ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
        ],
      ),
    );
  }
}
