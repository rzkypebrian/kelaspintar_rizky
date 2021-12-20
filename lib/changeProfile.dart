import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelaspintar_rizky/main.dart';

class ChangeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProfile(
        title: 'Ganti Foto Profile',
      ),
    );
  }
}

class MyProfile extends StatefulWidget {
  MyProfile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyProfile createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  File? imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
          child: Icon(Icons.keyboard_arrow_left_rounded),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        children: [
          Container(
              height: 350,
              width: double.infinity,
              child: imageFile != null
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(imageFile!),
                        ),
                      ),
                    )
                  : Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                            spreadRadius: 0.4,
                            offset: Offset(2, 5),
                          ),
                        ],
                      ),
                    )),
          GestureDetector(
            onTap: (){
              chooseImage(ImageSource.camera);
            },
            child: Container(
              margin: EdgeInsets.only(top: 25),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff006C84),
                borderRadius: BorderRadius.circular(6),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 0.4,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Ambil Dari Kamera",
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              chooseImage(ImageSource.gallery);
            },
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff006C84),
                borderRadius: BorderRadius.circular(6),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 0.4,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Ambil Dari Gallery",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
