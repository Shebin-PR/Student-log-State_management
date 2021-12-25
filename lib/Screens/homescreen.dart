import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Students", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          "Search",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box(hiveboxname).listenable(),
              builder: (BuildContext context, Box box, Widget? _) {
                if (box.values.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Text(
                        "No Students found",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return Container(
                  color: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
