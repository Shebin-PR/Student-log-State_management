import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/Screens/detailpage.dart';
import 'package:student_log/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchtext = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Students List",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
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
                    onChanged: (value) => setState(() {
                      searchtext = value;
                      print(searchtext);
                    }),
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
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
              child: Divider(
                thickness: 2,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box(hiveboxname).listenable(),
                builder: (BuildContext context, Box box, Widget? _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "No data available",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      Student obj = box.getAt(index);
                      dynamic avatar;
                      if (obj.imagepath != null) {
                        avatar = base64Decode(obj.imagepath);
                      }
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 15, right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffee9ca7),
                                Color(0xff4b6cb7),
                              ],
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              Get.to(StudentsDetailsPage(obj));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (ctx) =>
                              //             StudentsDetailsPage(obj)));
                            },
                            title: Text(
                              obj.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            leading: obj.imagepath == null
                                ? ClipOval(
                                    child: Image.asset(
                                    "assets/images/avatar.png",
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                  ))
                                : CircleAvatar(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipOval(
                                            child: Image.memory(
                                          avatar,
                                          fit: BoxFit.fill,
                                          width: 70,
                                          height: 70,
                                        )))),
                            trailing: IconButton(
                                onPressed: () {
                                  box.deleteAt(index);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Deleted Successfully")));
                                },
                                icon: Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
