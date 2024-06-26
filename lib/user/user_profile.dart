import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {

  var imageURL;
  XFile? _image;

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
            .collection("user sign in")
            .doc(ID)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  var ID = '';

  Future<void> getdata() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id')!;
      print('object3');
    });
  }

  DocumentSnapshot? _user;
  getUpdatedata() async {
    _user = await FirebaseFirestore.instance
        .collection('user sign in')
        .doc(ID)
        .get();
    print('object4');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUpdatedata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error:${snapshot.error}"),
          );
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                      _user!['path']==''?  Container(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/image/profile.jpg"),
                          ),
                        ): Container(
                        height: 150,
                        width: 150,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(_user!['path']),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: _user!["username"],
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
                      hintText: _user!["phone number"],
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
                      hintText: _user!["mail id"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
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
              ],
            ),
          ),
        );
      },
    );
  }
}
