import 'package:flutter/material.dart';
import 'package:student_log/Database/studentmodel.dart';

// ignore: must_be_immutable
class StudentsDetailsPage extends StatefulWidget {
  StudentsDetailsPage(this.obj, {Key? key}) : super(key: key);
  Student obj;

  @override
  State<StudentsDetailsPage> createState() => _StudentsDetailsPageState();
}

class _StudentsDetailsPageState extends State<StudentsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.obj.name),
    );
  }
}
