import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/home.dart';
import 'package:student_log/main.dart';

// ignore: must_be_immutable
class EditStudent extends StatefulWidget {
  EditStudent(this.obj, {Key? key}) : super(key: key);
  Student obj;

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  // TextEditingController newnamecontroller = TextEditingController();
  final _newformKey = GlobalKey<FormState>();

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
                    key: _newformKey,
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
                            onChanged: (value) => setState(() {
                              widget.obj.name = value;
                            }),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  widget.obj.name,
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
                            onChanged: (value) => setState(() {
                              widget.obj.age = value;
                            }),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  widget.obj.age,
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
                            onChanged: (value) => setState(() {
                              widget.obj.phone = value;
                            }),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                label: Text(
                                  widget.obj.phone,
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
                              if (_newformKey.currentState!.validate()) {
                                Box box = Hive.box(hiveboxname);
                                box.add(Student(
                                    name: widget.obj.name,
                                    age: widget.obj.age,
                                    phone: widget.obj.phone));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Student Updated successfully")));
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
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
