import "package:flutter/material.dart"; 
import 'package:hive_flutter/adapters.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/home.dart';

String hiveboxname = "allstudentsdetails";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentAdapter().typeId)) {
    Hive.registerAdapter(StudentAdapter());
  }
 await Hive.openBox(hiveboxname);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}