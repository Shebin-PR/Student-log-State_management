import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/GetX/studentcontroller.dart';
import 'package:student_log/home.dart';

String hiveboxname = "allstudentsdetails";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentAdapter().typeId)) {
    Hive.registerAdapter(StudentAdapter());
  }
  await Hive.openBox<Student>(hiveboxname);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/home", page: () => Home(), binding: StudentBinding())
      ],
      initialRoute: "/home",
    );
  }
}
