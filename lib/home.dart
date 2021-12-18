import 'package:flutter/material.dart';
import 'package:student_log/Screens/add_student.dart';
import 'package:student_log/Screens/homescreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List _pages = [HomeScreen(), AddNewStudent()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: "Add"),
        ],
      ),
    );
  }
}
