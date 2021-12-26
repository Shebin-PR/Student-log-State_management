import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/Screens/edit_student.dart';

// ignore: must_be_immutable
class StudentsDetailsPage extends StatelessWidget {
  StudentsDetailsPage(this.obj, {Key? key}) : super(key: key);
  Student obj;
  dynamic avatar;
  @override
  Widget build(BuildContext context) {
    if (obj.imagepath != null) {
      avatar = base64Decode(obj.imagepath);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: Center(
          child: Container(
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
            child: Column(
              children: [
                obj.imagepath != null
                    ? Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Container(
                            height: 210,
                            width: 210,
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                shape: BoxShape.circle),
                            child: ClipOval(
                                child: Image.memory(
                              avatar,
                              fit: BoxFit.cover,
                            ))),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Container(
                            height: 210,
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                shape: BoxShape.circle),
                            child: ClipOval(
                                child:
                                    Image.asset("assets/images/avatar.png"))),
                      ),
                Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Name : ",
                        style: textdecoration(),
                      ),
                      Text(
                        obj.name,
                        style: textdecoration(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Age : ",
                        style: textdecoration(),
                      ),
                      Text(
                        obj.age,
                        style: textdecoration(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Phone : ",
                        style: textdecoration(),
                      ),
                      Text(
                        obj.phone,
                        style: textdecoration(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.blue,
                  thickness: 2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditStudent()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.edit)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textdecoration() => TextStyle(
      color: Colors.blue,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      letterSpacing: 1);
}
