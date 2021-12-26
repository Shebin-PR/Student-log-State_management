import 'package:flutter/material.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/home.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  EditStudent(this.obj, {Key? key}) : super(key: key);
  Student obj;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            "Edit Student",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.teal[100],
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              obj.name,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              obj.age,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            label: Text(
                              obj.phone,
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.teal[500]),
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          "save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
