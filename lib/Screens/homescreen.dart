import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_log/Database/studentmodel.dart';
import 'package:student_log/GetX/studentcontroller.dart';
import 'package:student_log/Screens/detailpage.dart';
import 'package:student_log/main.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
            GetBuilder<StudentController>(
              builder: (controller) {
                return Padding(
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
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.8,
                          fontSize: 16,
                        ),
                        onChanged: (value) {
                          searchtext = value;
                          controller.update(["1"]);
                        },
                        decoration: InputDecoration(
                            label: Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
              child: Divider(
                thickness: 2,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: GetBuilder<StudentController>(
                id: "1",
                builder: (_controller) {
                  List<Student> results = searchtext.isEmpty
                      ? _controller.allstudentscontroller.values.toList()
                      : _controller.allstudentscontroller.values
                          .where((element) => element.name!
                              .toLowerCase()
                              .contains(searchtext.toLowerCase()))
                          .toList();
                  if (results.isEmpty) {
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
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      dynamic avatar;
                      if (results[index].imagepath != null) {
                        avatar = base64Decode(results[index].imagepath);
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
                              Get.to(() => StudentsDetailsPage(results[index]));
                            },
                            title: Text(
                              results[index].name!,
                              style: TextStyle(fontSize: 18),
                            ),
                            leading: results[index].imagepath == null
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
                                onPressed: () async {
                                  await _controller.allstudentscontroller
                                      .delete(results[index].key);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Deleted Successfully")));
                                  _controller.update(["1"]);
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
