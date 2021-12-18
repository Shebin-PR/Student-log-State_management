import 'package:flutter/material.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({Key? key}) : super(key: key);

  @override
  _AddNewStudentState createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
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
      body: Container(
        child: TextFormField(),
      ),
      ),
    );
  }
}
