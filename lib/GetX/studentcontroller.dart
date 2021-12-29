import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/main.dart';

class StudentController extends GetxController {
  Box<Student> allstudentscontroller = Hive.box(hiveboxname);
  int selectedInddex = 0;
  void addnewstudent(String name, String age, String phone, picture) {
    Student details =
        Student(name: name, age: age, phone: phone, imagepath: picture);
    allstudentscontroller.add(details);
    update();
  }
}

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
  }
}
