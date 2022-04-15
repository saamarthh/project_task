import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'profile.dart';

bool nameBool = true;
bool numberBool = true;
bool emailBool = true;

var _name = TextEditingController();
var _uname = TextEditingController();
var _number = TextEditingController();
var _email = TextEditingController();
var _bio = TextEditingController();
var imageFile;

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/profile': (context) => Profile(),
    },
  ));
}

// late File imageF;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? image;
  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
    imageFile = this.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            TextButton(
              onPressed: pickImage,
              child: image != null
                  ? Container(
                      height: 125.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        // border: Border.all(color: const Color(0x33A6A6A6)),
                        image: DecorationImage(
                            image: Image.file(image!).image, fit: BoxFit.cover),
                      ),
                    )
                  : CircleAvatar(
                      radius: 60.0,
                    ),
            ),
            SizedBox(height: 10),
            Text(
              'Full Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _name,
              enabled: nameBool,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              onSubmitted: (newValue) {
                setState(() {
                  _name.text = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Username:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _uname,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              onSubmitted: (newValue) {
                setState(() {
                  _uname.text = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'E-Mail:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _email,
              enabled: emailBool,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              onSubmitted: (newValue) {
                setState(() {
                  _email.text = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Mobile Number:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _number,
              enabled: numberBool,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              onSubmitted: (newValue) {
                setState(() {
                  _number.text = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Bio:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _bio,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onSubmitted: (newValue) {
                setState(() {
                  _bio.text = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nameBool = false;
                  emailBool = false;
                  numberBool = false;
                });
                Navigator.pushNamed(context, '/profile', arguments: {
                  'name': _name.text,
                  'uname': _uname.text,
                  'bio': _bio.text,
                  'number': _number.text,
                  'email': _email.text,
                  'image': imageFile
                });
              },
              child: Text(
                'SAVE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
            ),
          ]),
        ));
  }
}

//
