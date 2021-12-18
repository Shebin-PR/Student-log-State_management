import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          backgroundColor: Colors.black,
          title: const Text("LKG Students"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [],
          ),
        ),
      ),
    );
  }
}
