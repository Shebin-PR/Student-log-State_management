import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_log/GetX/studentcontroller.dart';
import 'package:student_log/home.dart';

// ignore: must_be_immutable
class AddNewStudent extends StatelessWidget {
  AddNewStudent({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  StudentController controller = Get.put(StudentController());
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  String name = "";
  String age = "";
  String phone = "";
  String avatarimage = "";
  dynamic picture;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Student",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal[100],
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "required";
                              }
                            },
                            controller: namecontroller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  "Name",
                                  style: TextStyle(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "required";
                              }
                            },
                            controller: agecontroller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  "Age",
                                  style: TextStyle(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "required";
                              }
                            },
                            controller: phonecontroller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  "Phone",
                                  style: TextStyle(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 130,
                          color: Colors.teal[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    final ImagePicker _picker = ImagePicker();
                                    // Pick an image
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    Uint8List avatarimage =
                                        await image!.readAsBytes();

                                    picture = await base64Encode(avatarimage);

                                    return null;
                                    // print(image!.path);
                                  },
                                  child: Text(
                                    "Add Image",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Icon(Icons.add_photo_alternate)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.teal[500]),
                            onPressed: () async {
                              name = namecontroller.text;
                              age = agecontroller.text;
                              phone = phonecontroller.text;
                              print('saved');
                              if (_formKey.currentState!.validate()) {
                                controller.addnewstudent(
                                    name, age, phone, picture);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Student Added successfully")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Student not added")));
                              }
                              Get.to(Home());
                            },
                            child: Text(
                              "save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
