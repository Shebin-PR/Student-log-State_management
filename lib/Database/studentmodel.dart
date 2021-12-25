import 'package:hive_flutter/hive_flutter.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class Student extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  int phone;

  @HiveField(3)
  dynamic imagepath;

  Student({
    required this.name,
    required this.age,
    required this.phone,
    this.imagepath,
  });
}
