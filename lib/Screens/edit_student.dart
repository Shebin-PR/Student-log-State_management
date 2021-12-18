import 'package:flutter/material.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            "Edit Student",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        /////////////////////////////-----------body------////////////////////
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 15),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          label: Text(
                            "Name",
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          label: Text(
                            "Reg.NO",
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          label: Text(
                            "DD/MM/YY",
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          label: Text(
                            "Mail",
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          label: Text(
                            "Phone",
                            style: TextStyle(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    color: Colors.black12,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.photo_camera_back_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
