import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mech_Edit_Profile extends StatefulWidget {
  const Mech_Edit_Profile({super.key});

  @override
  State<Mech_Edit_Profile> createState() => _Mech_Edit_ProfileState();
}

class _Mech_Edit_ProfileState extends State<Mech_Edit_Profile> {
  var username_ = TextEditingController();
  var phnnum = TextEditingController();
  var email = TextEditingController();
  var wrkexp = TextEditingController();
  var wrkshop = TextEditingController();

  var ID = '';

  var imageURL;
  XFile? _image;

  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final data = await SharedPreferences.getInstance();
    ID = data.getString('id')!;

    setState(() {});
  }


  Future<void> pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
        FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Uploaded succesfully",
              style: TextStyle(color: Colors.green),
            )));

        FirebaseFirestore.instance
            .collection("mech sign in")
            .doc(ID)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

  updateProfile() async {
    await FirebaseFirestore.instance.collection("mech sign up").doc(ID).update({
      "username": username_.text,
      "email": email.text,
      "phone num": phnnum.text,
      "work exp": wrkexp.text,
      "workshop": wrkshop.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT PROFILE",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/image/profile.jpg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 110, 0, 0),
                      child: Container(
                        child: IconButton(onPressed: (){
                          pickimage();

                        }, icon: Icon(Icons.camera_alt_outlined)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
            //   child: TextFormField(
            //     controller: ,
            //     decoration: InputDecoration(
            //       hintText: "Enter Your Name",
            //       labelText: "Name",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15),
            //         borderSide: BorderSide(
            //             style: BorderStyle.solid
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: username_,
                decoration: InputDecoration(
                  hintText: "Enter Your Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: phnnum,
                decoration: InputDecoration(
                  hintText: "Enter Your Phone Number",
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Your e-mail",
                  labelText: "e-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: wrkexp,
                decoration: InputDecoration(
                  hintText: "Enter Your Work Experience",
                  labelText: "Work Experience",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Location",
                  labelText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
              child: TextFormField(
                controller: wrkshop,
                decoration: InputDecoration(
                  hintText: "Enter Your Shop Name",
                  labelText: "Shop Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                      side: BorderSide(color: Colors.purple)),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  elevation: 30,
                ),
                child: Text(
                  "DONE",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
