import 'package:flutter/material.dart';
import 'package:flutter_firebase/Compenents/drawer.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: MyDrawer(),
          
    );
  }
}
