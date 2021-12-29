import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_log/Screens/add_student.dart';
import 'package:student_log/Screens/homescreen.dart';

import 'GetX/studentcontroller.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List _pages = [HomeScreen(), AddNewStudent()];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(
      id: "2",
      builder: (_controller) {
        return Scaffold(
          body: _pages[_controller.selectedInddex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            currentIndex: _controller.selectedInddex,
            onTap: (newIndex) {
              _controller.selectedInddex = newIndex;
              _controller.update(["2"]);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_add), label: "Add"),
            ],
          ),
        );
      },
    );
  }
}
