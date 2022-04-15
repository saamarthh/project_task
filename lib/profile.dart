import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String name;
    late String uname;
    late String email;
    late String number;
    late String bio;
    var image;
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (routes != null) {
      name = routes['name'];
      uname = routes['uname'];
      email = routes['email'];
      number = routes['number'];
      bio = routes['bio'];
      image = routes['image'];
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 225.0,
            width: 225.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(color: const Color(0x33A6A6A6)),
                image: DecorationImage(
                    image: Image.file(image!).image, fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Text(
              uname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Text(
              bio,
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DetailCard(Key: 'Full Name:', Value: name),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DetailCard(Key: 'Email Address:', Value: email),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DetailCard(Key: 'Mobile Number:', Value: number),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'EDIT',
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
          ),
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String Key;
  final String Value;

  DetailCard({required this.Key, required this.Value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Key,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(Value),
      ],
    );
  }
}
