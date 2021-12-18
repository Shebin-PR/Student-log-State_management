import 'package:flutter/material.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({Key? key}) : super(key: key);

  @override
  _AddNewStudentState createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController regnocontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

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

        /////////////////////////////-----------body------////////////////////
        body: Center(
          child: Container(
            height: 500,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal[100],
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Form(
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
                        controller: dobcontroller,
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
                      width: 100,
                      color: Colors.black12,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.photo_camera_back_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: () {},
                        child: Text(
                          "save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))
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
