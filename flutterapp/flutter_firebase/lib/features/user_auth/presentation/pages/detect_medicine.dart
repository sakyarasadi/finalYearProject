import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/addMoreInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescription Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScanScreen(),
    );
  }
}

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late File _imageFile = File(''); // Initialize _imageFile with an empty File
  String _detectedInfo = '';

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _detectPrescription() async {
  if (_imageFile == null || _imageFile.path.isEmpty) {
    print('Error: Image not selected');
    return;
  }

  try {
    final response = await http.post(
      Uri.parse('http://localhost:5000/process_prescription'),
      body: {'image': _imageFile.path},
    );

    if (response.statusCode == 200) {
      print('Prescription information added successfully');
      // Navigate to AddMoreInfoPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddMoreInfoPage()),
      );
    } else {
      // Display error message received from the server
      final jsonResponse = jsonDecode(response.body);
      print('Failed to detect prescription information. Error: ${jsonResponse['error']}');
    }
  } catch (e) {
    print('Error sending prescription data: $e');
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: _imageFile != null && _imageFile.path.isNotEmpty
                    ? DecorationImage(
                        image: FileImage(_imageFile),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _imageFile != null && _imageFile.path.isNotEmpty
                  ? null
                  : Center(
                      child: Text(
                        'No image selected',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getImage(ImageSource.gallery);
              },
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getImage(ImageSource.camera);
              },
              child: Text('Take Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _detectPrescription();
              },
              child: Text('Detect Prescription'),
            ),
            SizedBox(height: 20),
            Text(
              _detectedInfo,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
